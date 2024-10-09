import 'package:grpc/grpc.dart';
import 'package:file_manager_app/protos/sync.pbgrpc.dart';

class SyncClient {
  ClientChannel channel;
  SyncServiceClient stub;

  SyncClient()
      : channel = ClientChannel(
          'localhost',
          port: 50051,
          options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
        ),
        stub = SyncServiceClient(channel);

  Future<void> ping() async {
    final response = await stub.ping(PingRequest());
    print('Ping response: ${response.message}');
  }

  Future<void> sync(SyncRequest request) async {
    final response = await stub.sync(request);
    // Maneja la respuesta de sincronización aquí
  }

  Future<void> upload(Stream<FileUploadRequest> request) async {
    final response = await stub.upload(request);
    // Maneja la respuesta de subida aquí
  }

  Future<void> download(DownloadRequest request) async {
    final response = await stub.download(request);
    // Maneja la respuesta de descarga aquí
  }
}