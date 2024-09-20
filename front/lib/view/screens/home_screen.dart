import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:base64/base64.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String serverAddress = '192.168.221.179';
  var pagina = 0; //es un paginador
  List<int> pre = [];
  List<FileSystemEntity> entities = [];
  Directory? currentDirectory;

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndLoadFiles();
  }

  Future<void> _checkPermissionsAndLoadFiles() async {
    final status = await Permission.storage.status;

    if (status.isGranted) {
      // Si el permiso está concedido, carga los archivos
      _loadFiles();
    } else if (status.isDenied) {
      // Si el permiso está denegado, solicita permiso
      final result = await Permission.storage.request();
      if (result.isGranted) {
        _loadFiles();
      } else {
        _showPermissionDeniedSnackBar();
      }
    } else if (status.isPermanentlyDenied) {
      // Si el permiso está permanentemente denegado, muestra un mensaje
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permiso permanentemente denegado. Ve a ajustes para habilitarlo.'),
          action: SnackBarAction(
            label: 'Ir a Ajustes',
            onPressed: () {
              openAppSettings();
            },
          ),
        ),
      );
    }
  }

  void _showPermissionDeniedSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Permiso denegado para acceder al almacenamiento'),
        action: SnackBarAction(
          label: 'Solicitar Permisos',
          onPressed: () async {
            final result = await Permission.storage.request();
            if (result.isGranted) {
              _loadFiles();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Permiso aún denegado')),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _loadFiles() async {
    // Asegúrate de que se manejen correctamente los directorios nulos
    final directory = await getExternalStorageDirectory();
    if (directory != null) {
      setState(() {
        currentDirectory = directory;
        entities = directory.listSync();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo obtener el directorio de almacenamiento externo')),
      );
    }
  }

  void _addFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = File(result.files.single.path!);
      final newFile = File('${currentDirectory!.path}/${file.uri.pathSegments.last}');
      await file.copy(newFile.path);
      _loadFiles();
    }
  }

  void _addFolder() async {
    final folderName = await _showTextInputDialog('Nuevo nombre de carpeta');
    if (folderName != null && folderName.isNotEmpty) {
      final newFolder = Directory('${currentDirectory!.path}/$folderName');
      newFolder.create();
      _loadFiles();
    }
  }

  Future<void> _deleteEntity(FileSystemEntity entity) async {
    if (entity is File) {
      await entity.delete();
    } else if (entity is Directory) {
      await entity.delete(recursive: true);
    }
    _loadFiles();
  }

  Future<void> _renameEntity(FileSystemEntity entity) async {
    final newName = await _showTextInputDialog('Nuevo nombre');
    if (newName != null && newName.isNotEmpty) {
      final newPath = '${currentDirectory!.path}/$newName';
      await entity.rename(newPath);
      _loadFiles();
    }
  }

  Future<void> _moveEntity(FileSystemEntity entity) async {
    final newFolder = await _selectFolder();
    if (newFolder != null) {
      final newPath = '${newFolder.path}/${entity.uri.pathSegments.last}';
      await entity.rename(newPath);
      _loadFiles();
    }
  }

  Future<Directory?> _selectFolder() async {
    // Implementa la selección de carpeta aquí
    return null; // Reemplázalo con la implementación real
  }

  Future<String?> _showTextInputDialog(String title) async {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Nombre'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Aceptar'),
              onPressed: () => Navigator.of(context).pop(controller.text),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Archivos'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: _addFile,
                  child: Text('Agregar Archivo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addFolder,
                  child: Text('Agregar Carpeta'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            Expanded(
              child: entities.isNotEmpty
                  ? ListView.builder(
                      itemCount: entities.length,
                      itemBuilder: (context, index) {
                        final entity = entities[index];
                        return ListTile(
                          leading: entity is File
                              ? Icon(Icons.insert_drive_file, color: Colors.yellow)
                              : Icon(Icons.folder, color: Colors.orange),
                          title: Text(
                            entity.uri.pathSegments.last,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            if (entity is Directory) {
                              setState(() {
                                currentDirectory = entity;
                                _loadFiles();
                              });
                            }
                          },
                          trailing: PopupMenuButton(
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry>[
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.delete, color: Colors.red),
                                      Text("Eliminar"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'rename',
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.edit, color: Colors.blue),
                                      Text("Renombrar"),
                                    ],
                                  ),
                                ),
                                if (entity is File)
                                  PopupMenuItem(
                                    value: 'move',
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.move_to_inbox, color: Colors.green),
                                        Text("Mover"),
                                      ],
                                    ),
                                  ),
                              ];
                            },
                            onSelected: (value) {
                              switch (value) {
                                case 'delete':
                                  _deleteEntity(entity);
                                  break;
                                case 'rename':
                                  _renameEntity(entity);
                                  break;
                                case 'move':
                                  _moveEntity(entity);
                                  break;
                              }
                            },
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('No hay archivos', style: TextStyle(color: Colors.grey[600])),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
