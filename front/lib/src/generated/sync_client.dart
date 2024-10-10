import 'dart:async';
import 'dart:io';
import 'package:grpc/grpc.dart';
import 'package:path/path.dart' as p;
import 'package:file_manager_app/src/generated/sync.pbgrpc.dart';

class SyncClient {
  ClientChannel channel; // Canal de comunicación con el servidor
  late SyncServiceClient stub;
  final String dirPath = "/path/to/syncfolder"; // Ruta del directorio de sincronización
  final String username = "your_username"; // Nombre de usuario

  SyncClient()
      : channel = ClientChannel(
          'localhost',
          port: 50051,
          options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
        ) {
    stub = SyncServiceClient(channel);
  }

  Future<void> sync(SyncRequest request) async {
    try {
      final SyncResponse response = await stub.sync(request);
      response.elements.forEach((key, value) {
        print('Key: $key');
        if (key == 'toClientRemove') {
          value.elements.forEach((fileData) {
            removeFile(fileData.path);
          });
        } else if (key == 'toSendToServer' || key == 'toServerUpdate') {
          value.elements.forEach((fileData) {
            upload(fileData.path, fileData.folderFingerprint);
          });
        } else if (key == 'toClientCreate') {
          value.elements.forEach((fileData) {
            if (fileData.isDir) {
              createDirectory(fileData.path);
            } else {
              download(fileData.path, fileData.fingerprint);
            }
          });
        } else if (key == 'toClientUpdate') {
          value.elements.forEach((fileData) {
            download(fileData.path, fileData.fingerprint);
          });
        }
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void removeFile(String path) {
    final file = File('$dirPath/$path');
    if (file.existsSync()) {
      file.deleteSync();
      print('File removed: $path');
    } else {
      print('File not found: $path');
    }
  }

  void createDirectory(String path) {
    final directory = Directory('$dirPath/$path');
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('Directory created: $path');
    }
  }

  Future<void> upload(String path, String folderFingerprint) async {
    final file = File('$dirPath/$path');
    if (!file.existsSync()) {
      print('File not found: $path');
      return;
    }

    final fileStream = file.openRead();
    final requestController = StreamController<FileUploadRequest>();

    final responseFuture = stub.upload(requestController.stream);

    responseFuture.then((response) {
      print('Upload response: $response');
    }).catchError((error) {
      print('Upload error: $error');
    }).whenComplete(() {
      print('Upload completed');
      requestController.close();
    });

    await for (var chunk in fileStream) {
      final request = FileUploadRequest(
        fileName: p.basename(file.path),
        folderFingerprint: folderFingerprint,
        chunk: chunk,
        username: username,
      );
      requestController.add(request);
    }

    await requestController.close();
  }

  Future<void> download(String path, String fingerprint) async {
    final file = File('$dirPath/$path');
    final outputStream = file.openWrite();

    final request = DownloadRequest(fingerprint: fingerprint);
    final responseObserver = ResponseStreamObserver<DownloadResponse>(
      onNext: (response) {
        outputStream.add(response.chunk);
      },
      onError: (error) {
        print('Download error: $error');
      },
      onCompleted: () async {
        await outputStream.close();
        print('Download completed: $path');
      },
    );

    await for (var response in stub.download(request)) {
      responseObserver.onNext(response);
    }
    responseObserver.onCompleted();
  }
}

class ResponseStreamObserver<T> {
  final void Function(T value) onNext;
  final void Function(Object error) onError;
  final void Function() onCompleted;

  ResponseStreamObserver({
    required this.onNext,
    required this.onError,
    required this.onCompleted,
  });

}