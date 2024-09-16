// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../Login/LoginPage.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:base64/base64.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String serverAddress = '192.168.221.179';
  late List<Map<String, dynamic>> entities =[]; // en esta variable almaceno los archivos
  var pagina = 0; //es un paginador
  List<int> pre = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      final url = Uri.parse(
          'http://$serverAddress:3000/folders/get_folders_by_parent_id'); //url del backend
      final storage = FlutterSecureStorage();
      final accessToken = await storage.read(key: 'accessToken'); //lee el token
      print(accessToken); //print en consola del token

      final response = await http.get(
        //hago la peticion al backend de los archivos que hay
        Uri.parse('$url?token=$accessToken&parentFolder=$pagina'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        //si está bien la peticion (200)
        final Map<String, dynamic>? responseData = json.decode(response.body);
        final dynamic filesData =
            responseData?['get_folders_by_parent_id_response']?['files']
                ?['file_and_folder_model']; //almaceno el json de los archivos

        if (filesData != null) {
          if (filesData is List) {
            // Si filesData es una lista, actualiza entities con los elementos de la lista
            setState(() {
              entities = filesData.map<Map<String, dynamic>>((data) {
                //recorre cada elemento de la lista
                if (data['type'] == 'file') {
                  return {
                    'name': data['file_name'],
                    'type': 'file',
                    'id': data['id']
                  };
                } else {
                  return {
                    'name': data['folder_name'],
                    'type': 'folder',
                    'parent_floder': data['parent_folder'],
                    'id': data['id']
                  };
                }
              }).toList();
            });
          } else {
            // Si filesData no es una lista (sino un solo elemento), actualiza entities con ese elemento
            setState(() {
              entities = [
                if (filesData['type'] == 'file')
                  {
                    'name': filesData['file_name'],
                    'type': 'file',
                    'id': filesData['id']
                  }
                else
                  {
                    'name': filesData['folder_name'],
                    'type': 'folder',
                    'parent_floder': filesData['parent_folder'],
                    'id': filesData['id']
                  }
              ];
            });
          }
        } else {
          setState(() {
            entities = []; // Asigna una lista vacía si filesData es null
          });
        }
      } else {
        print('Error al obtener los datos de la API: ${response.statusCode}');
      }
    } catch (e) {
      print('Excepción al obtener los datos de la API: $e');
      setState(() {
        entities =
            []; // Si hay una excepción, establece entities como una lista vacía
      });
    }
  }

  Future<void> createNewFile(String fileName, File file) async {
    //se llama create pero debería ser upload
    try {
      final storage = FlutterSecureStorage();
      final accessToken = await storage.read(key: 'accessToken');
      final folderParent = pagina;

      // Calcular el tamaño del archivo
      final fileSize = await file.length();

      // Construir el cuerpo de la solicitud
      final body = json.encode({
        'token': accessToken,
        'file': base64Encode(file.readAsBytesSync()),
        'fileName': fileName,
        'folderParent': folderParent,
        'filesize': fileSize,
      });

      final response = await http.post(
        Uri.parse('http://$serverAddress:3000/files/createfile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        // Manejar la creación exitosa del archivo
        print('Archivo creado exitosamente');
        fetchDataFromApi(); // Actualizar la lista de archivos y carpetas
      } else {
        // Manejar errores en la creación del archivo
        print('Error al crear el archivo: ${response.statusCode}');
      }
    } catch (e) {
      print('Excepción al crear el archivo: $e');
    }
  }

  Future<void> showNewFileDialog(BuildContext context) async {
    final TextEditingController fileNameController = TextEditingController();

    // Mostrar ventana emergente para ingresar nombre de archivo y seleccionar archivo
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(); //uso la librería filepicker para escoger el archivo
    if (result != null) {
      File file = File(result.files.single.path!);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Crear Nuevo Archivo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: fileNameController,
                  decoration: InputDecoration(hintText: 'Nombre del archivo'),
                ),
                SizedBox(height: 10),
                Text('Archivo seleccionado: ${result.files.single.name}'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Crear'),
                onPressed: () async {
                  String fileName = fileNameController.text.trim();
                  if (fileName.isNotEmpty) {
                    await createNewFile(fileName, file);
                    Navigator.of(context).pop();
                  } else {
                    // Mostrar un mensaje de error si el nombre del archivo está vacío
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Por favor, ingrese un nombre para el archivo')),
                    );
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xFFD26753),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  value: 'button1',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.file_present,
                        color: Colors.orange,
                      ),
                      const Text("New File"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'button2',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.folder_open, color: Colors.orange),
                      const Text("New Folder"),
                    ],
                  ),
                ),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case 'button1': // en el caso de escoger el primer boton
                  showNewFileDialog(context);
                  break;
                case 'button2':
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String folderName = '';
                      return AlertDialog(
                        title: Text('Create New Folder'),
                        content: TextField(
                          onChanged: (value) {
                            folderName = value;
                          },
                          decoration:
                              InputDecoration(hintText: 'Enter folder name'),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Create'),
                            onPressed: () async {
                              final storage = FlutterSecureStorage();
                              final accessToken = await storage.read(
                                  key:
                                      'accessToken'); // Set the parent folder ID here

                              final response = await http.post(
                                Uri.parse(
                                    'http://$serverAddress:3000/folders/registerfoldersoap'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                },
                                body: json.encode(<String, dynamic>{
                                  'token': accessToken,
                                  'folderName': folderName,
                                  'parentFolder': pagina,
                                }),
                              );
                              if (response.statusCode == 200) {
                                // Handle successful folder creation
                                print(pagina);
                                Navigator.of(context).pop();
                                fetchDataFromApi(); // Refresh the list of files and folders
                              } else {
                                // Handle error in folder creation
                                print(
                                    'Error creating folder: ${response.statusCode}');
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                  break;
              }
            },
            child: Icon(Icons.create_new_folder_outlined, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Get.offAll(LoginPage());
            },
            icon: Icon(Icons.logout_rounded, color: Colors.white),
          ),
        ],
        title: const Text(
          "File Manager",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: Visibility(
          visible: pagina != 0, // boton de ir hacia atrás
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () async {
              pagina = pre.last; //pagina será igual a la carpeta anterior
              pre.removeLast();
              fetchDataFromApi();
            },
          ),
        ));
  }

  Widget build(BuildContext context) {
    // Vista del Homepage
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: entities.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 0),
                      itemCount: entities.length,
                      itemBuilder: (context, index) {
                        final entity = entities[index];
                        return ListTile(
                          leading: entity['type'] == 'file'
                              ? Card(
                                  color: Colors.yellow,
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        "assets/3d/copy-dynamic-premium.png"),
                                  ),
                                )
                              : Card(
                                  color: Colors.orange,
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        "assets/3d/folder-dynamic-color.png"),
                                  ),
                                ),
                          title: Text(
                            entity['name'] ?? '',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () async {
                            if (entity['type'] != 'file') {
                              // Si es una carpeta, cambio de página
                              pre.add(pagina);
                              pagina = int.tryParse(entity['id'] ?? '0') ?? 0;
                            }
                            fetchDataFromApi();
                            print(pagina);
                          },
                          trailing: PopupMenuButton(
                            // Popup 3 puntitos :3
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry>[
                                PopupMenuItem(
                                  value: 'button1',
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.delete, color: Colors.red),
                                      const Text(
                                          "Delete"), // El servidor no responde
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'button2',
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.edit, color: Colors.blue),
                                      const Text("Edit"),
                                    ],
                                  ),
                                ),
                                if (entity['type'] == 'file')
                                  PopupMenuItem(
                                    value: 'download',
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.download,
                                            color: Colors.green),
                                        const Text("Download"),
                                      ],
                                    ),
                                  ),
                                PopupMenuItem(
                                  value: 'button3',
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.share, color: Colors.green),
                                      const Text("Share"), // No funcional aún
                                    ],
                                  ),
                                ),
                              ];
                            },
                            onSelected: (value) async {
                              switch (value) {
                                case 'download':
                                  // Realizar la solicitud para descargar el archivo
                                  final storage = FlutterSecureStorage();
                                  final accessToken =
                                      await storage.read(key: 'accessToken');

                                  final response = await http.post(
                                    Uri.parse(
                                        'http://$serverAddress:3000/files/downloadfile'),
                                    headers: <String, String>{
                                      'Content-Type':
                                          'application/json; charset=UTF-8',
                                    },
                                    body: json.encode({
                                      'token': accessToken,
                                      'fileId': entity['id'],
                                    }),
                                  );

                                  if (response.statusCode == 200) {
                                    final responseData =
                                        json.decode(response.body);
                                    final downloadFileResult = json.decode(
                                        responseData['download_file_response']
                                            ['download_file_result']);
                                    final filePaths =
                                        downloadFileResult['file_paths'];

                                    if (filePaths.isNotEmpty) {
                                      final fileUrl =
                                          'http://${filePaths.first}';
                                      // Abrir el enlace en el navegador del dispositivo
                                      await launchUrl(Uri.parse(fileUrl));
                                    } else {
                                      print(
                                          'No se encontraron enlaces de descarga');
                                    }
                                  } else {
                                    print(
                                        'Error al descargar el archivo: ${response.statusCode}');
                                  }
                                  break;

                                case 'button1':
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            'Eliminar ${entity != null && entity['type'] == 'file' ? 'Archivo' : 'Carpeta'}'),
                                        content: Text(
                                            '¿Estás seguro de que deseas eliminar ${entity != null && entity['type'] == 'file' ? 'este archivo' : 'esta carpeta'}?'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Cancelar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Eliminar'),
                                            onPressed: () async {
                                              // Realizar la eliminación según el tipo de archivo o carpeta
                                              final storage =
                                                  FlutterSecureStorage();
                                              final accessToken = await storage
                                                  .read(key: 'accessToken');

                                              final url = entity != null &&
                                                      entity['type'] == 'file'
                                                  ? 'http://$serverAddress:3000/files/deletefile'
                                                  : 'http://$serverAddress:3000/folders/delete_folder_soap';

                                              final body = entity != null &&
                                                      entity['type'] == 'file'
                                                  ? json.encode({
                                                      'token': accessToken,
                                                      'fileId': entity['id'],
                                                    })
                                                  : json.encode({
                                                      'token': accessToken,
                                                      'folderId': entity['id'],
                                                    });

                                              final response =
                                                  await http.delete(
                                                // Cambio a http.delete
                                                Uri.parse(url),
                                                headers: <String, String>{
                                                  'Content-Type':
                                                      'application/json; charset=UTF-8',
                                                },
                                                body: body,
                                              );

                                              if (response.statusCode == 200) {
                                                print(
                                                    '${entity['type']} eliminado exitosamente');
                                                fetchDataFromApi(); // Actualizar la lista de archivos y carpetas
                                              } else {
                                                print(
                                                    'Error al eliminar ${entity['type']}: ${response.statusCode}');
                                              }

                                              Navigator.of(context)
                                                  .pop(); // Cerrar el diálogo
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  break;

                                case 'button2':
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      final TextEditingController
                                          fileNameController =
                                          TextEditingController(
                                              text: entity['name']);
                                      final TextEditingController
                                          fileParentController =
                                          TextEditingController(
                                              text: pagina.toString());
                                      String newName = entity['name'];
                                      String newParent = pagina.toString();
                                      return AlertDialog(
                                        title: Text(
                                            'Editar ${entity != null && entity['type'] == 'file' ? 'Archivo' : 'Carpeta'}'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            TextField(
                                              controller: fileNameController,
                                              onChanged: (value) {
                                                newName = value;
                                              },
                                              decoration: InputDecoration(
                                                hintText: 'Nuevo nombre',
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    16), // Espacio entre los TextField
                                            TextField(
                                              controller: fileParentController,
                                              onChanged: (value) {
                                                newParent = value;
                                              },
                                              decoration: InputDecoration(
                                                hintText: 'Nuevo padre',
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Cancelar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Aceptar'),
                                            onPressed: () async {
                                              if (newName.isNotEmpty && newParent.isNotEmpty) {
                                                // Realizar la actualización según el tipo de archivo o carpeta
                                                final storage =
                                                    FlutterSecureStorage();
                                                final accessToken =
                                                    await storage.read(
                                                        key: 'accessToken');

                                                final url = entity != null &&
                                                        entity['type'] == 'file'
                                                    ? 'http://$serverAddress:3000/files/updatefile'
                                                    : 'http://$serverAddress:3000/folders/update_folder_soap';

                                                final body = entity != null &&
                                                        entity['type'] == 'file'
                                                    ? json.encode({
                                                        'token': accessToken,
                                                        'fileId': entity['id'],
                                                        'fileName': newName,
                                                        'folderParent':
                                                            newParent,
                                                      })
                                                    : json.encode({
                                                        'token': accessToken,
                                                        'parentFolder': newParent,
                                                        'folderId':
                                                            entity['id'],
                                                        'folderName': newName,
                                                      });

                                                final response = await http.put(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'Content-Type':
                                                        'application/json; charset=UTF-8',
                                                  },
                                                  body: body,
                                                );
                                                print(response.statusCode);
                                                if (response.statusCode == 200) {
                                                  print('actualizado exitosamente');
                                                  fetchDataFromApi(); // Actualizar la lista de archivos y carpetas
                                                } else {
                                                  print(
                                                      'Error al actualizar}: ${response.statusCode}');
                                                }
                                                print("navigator");
                                                Navigator.of(context).pop(); // Cerrar el diálogo
                                              } else {
                                                print("else");
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'Por favor, ingrese un nombre válido')),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  break;

                                case 'button3':
                                  showDialog(
                                    //para mostrar la ventana de del input
                                    context: context,
                                    builder: (BuildContext context) {
                                      final TextEditingController
                                          userIdController =
                                          TextEditingController();
                                      String selectedUserId = "";

                                      return AlertDialog(
                                        title: Text(
                                            'Compartir ${entity['type'] == 'file' ? 'Archivo' : 'Carpeta'}'),
                                        content: TextField(
                                          controller: userIdController,
                                          onChanged: (value) {
                                            selectedUserId = value;
                                          },
                                          decoration: InputDecoration(
                                              hintText: 'ID de usuario'),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Cancelar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Aceptar'),
                                            onPressed: () async {
                                              if (selectedUserId != null &&
                                                  selectedUserId.isNotEmpty) {
                                                final storage =
                                                    FlutterSecureStorage();
                                                final accessToken =
                                                    await storage.read(
                                                        key: 'accessToken');

                                                final url = entity['type'] ==
                                                        'file'
                                                    ? 'http://$serverAddress:3000/files/sharefile'
                                                    : 'http://$serverAddress:3000/folders/share_folder_soap';

                                                final body = entity['type'] ==
                                                        'file'
                                                    ? json.encode({
                                                        'token': accessToken,
                                                        'fileId': entity['id'],
                                                        'user': selectedUserId,
                                                      })
                                                    : json.encode({
                                                        'token': accessToken,
                                                        'folderId':
                                                            entity['id'],
                                                        'sharedUserId':
                                                            selectedUserId,
                                                      });

                                                final response = await http.put(
                                                  //hago peticiion hhtp a la API
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'Content-Type':
                                                        'application/json; charset=UTF-8',
                                                  },
                                                  body: body,
                                                );

                                                if (response.statusCode == 200) {
                                                  final responseData = json
                                                      .decode(response.body);

                                                  if (responseData[
                                                          'share_folder_soap_response'] !=
                                                      null) {
                                                    final result = responseData[
                                                                'share_folder_soap_response']
                                                            [
                                                            'share_folder_soap_result'] ??
                                                        '';

                                                    if (result.isNotEmpty) {
                                                      print('$result');
                                                      fetchDataFromApi(); // Actualizar la lista de archivos y carpetas
                                                    } else {
                                                      print(
                                                          'Error al compartir ${entity['type']}');
                                                    }
                                                  } else {
                                                    print(
                                                        'Error: No se encontró la clave "share_folder_soap_response" en la respuesta.');
                                                  }
                                                } else {
                                                  print(
                                                      'Error al compartir ${entity['type']}: ${response.statusCode}');
                                                }

                                                Navigator.of(context)
                                                    .pop(); // Cerrar el diálogo
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'Por favor, ingrese un ID de usuario válido')),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  break;
                              }
                            },
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                          'No hay archivos'), // Mostrar un mensaje cuando entities esté vacío
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
