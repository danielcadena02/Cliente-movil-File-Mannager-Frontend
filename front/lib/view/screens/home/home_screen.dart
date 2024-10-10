import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:file_manager_app/Login/LoginPage.dart';
import 'package:file_manager_app/view/screens/home/controller/files_controller.dart';
import 'package:file_manager_app/view/screens/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:file_picker/file_picker.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({Key? key, required this.token}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FilesController myController = Get.put(FilesController());
  String searchQuery = '';
  var gotPermission = false;
  var isMoving = false;
  var fullScreen = false;
  var isSearching = false;
  late FileSystemEntity selectedFile;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }
  Future<void> _requestPermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        gotPermission = true;
      });
    } else {
      setState(() {
        gotPermission = false;
      });
    }
  }

  @override
   Widget build(BuildContext context) {
    return ControlBackButton(
      controller: myController.controller,
      child: Scaffold(
        appBar: appBar(context),
        body: FileManager(
          controller: myController.controller,
          builder: (context, snapshot) {
            myController.calculateSize(snapshot);
            final List<FileSystemEntity> entities = isSearching
                ? snapshot.where((element) => element.path.contains(searchQuery)).toList()
                : snapshot.where((element) => element.path != '/storage/emulated/0/Android').toList();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Visibility(
                    visible: !fullScreen,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 7.5.h,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  isSearching = true;
                                  searchQuery = value;
                                  if (searchQuery.isEmpty) {
                                    isSearching = false;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: 'Search Files',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                      itemCount: entities.length,
                      itemBuilder: (context, index) {
                        FileSystemEntity entity = entities[index];

                        return Ink(
                          color: Colors.transparent,
                          child: ListTile(
                            trailing: PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                return <PopupMenuEntry>[
                                  PopupMenuItem(
                                    value: 'button1',
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.delete, color: Colors.red),
                                        const Text("Delete"),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'button2',
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.rotate_left_sharp, color: Colors.blue),
                                        const Text("Rename"),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'button3',
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.move_down_rounded, color: Colors.green),
                                        const Text("Move"),
                                      ],
                                    ),
                                  ),
                                ];
                              },
                              onSelected: (value) async {
                                switch (value) {
                                  case 'button1':
                                    await entity.delete(recursive: true).then((_) {
                                      setState(() {});
                                    });
                                    break;
                                  case 'button2':
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        TextEditingController renameController = TextEditingController();
                                        return AlertDialog(
                                          title: Text("Rename ${FileManager.basename(entity)}"),
                                          content: TextField(controller: renameController),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancel"),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await entity.rename("${myController.controller.getCurrentPath}/${renameController.text.trim()}").then((_) {
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                });
                                              },
                                              child: const Text("Rename"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    break;
                                  case 'button3':
                                    selectedFile = entity;
                                    setState(() {
                                      isMoving = true;
                                    });
                                    break;
                                }
                              },
                              child: const Icon(Icons.more_vert),
                            ),
                            leading: FileManager.isFile(entity)
                                ? Card(color: Colors.yellow, elevation: 0, child: Padding(padding: const EdgeInsets.all(8.0), child: Image.asset("assets/3d/copy-dynamic-premium.png")))
                                : Card(color: Colors.orange, elevation: 0, child: Padding(padding: const EdgeInsets.all(8.0), child: Image.asset("assets/3d/folder-dynamic-color.png"))),
                            title: Text(FileManager.basename(entity, showFileExtension: true), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                            subtitle: subtitle(entity),
                            onTap: () async {
                              if (FileManager.isDirectory(entity)) {
                                try {
                                  myController.controller.openDirectory(entity);
                                } catch (e) {
                                  myController.alert(context, "Unable to open this folder");
                                }
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: gotPermission == false
            ? FloatingActionButton.extended(
                onPressed: () async {
                  await getPermission();
                },
                label: const Text("Request File Access Permission"),
              )
            : null,
      ),
    );
  }

  Future<void> getPermission() async {
    if (await Permission.storage.request().isGranted) {
      gotPermission = true;
      setState(() {});
    }
  }

  AppBar appBar(BuildContext context) {
  return AppBar(
    actions: [
      IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () {
          Get.offAll(LoginPage());
        },
      ),
      IconButton(
        icon: const Icon(Icons.share_outlined),
        onPressed: () {
        },
      ),
      Visibility(
        visible: isMoving,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              selectedFile.rename(
                "${myController.controller.getCurrentPath}/${FileManager.basename(selectedFile)}"
              );
              setState(() {
                isMoving = false;
              });
            },
            child: Row(
              children: const [
                Text("Move here ", style: TextStyle(fontWeight: FontWeight.w500)),
                Icon(Icons.paste),
              ],
            ),
          ),
        ),
      ),
      Visibility(
        visible: !isMoving,
        child: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                value: 'button1',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.file_present, color: Colors.blue),
                    const Text("New File"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'button2',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.folder_open, color: Colors.green),
                    const Text("New Folder"),
                  ],
                ),
              ),
            ];
          },
          onSelected: (value) async {
            switch (value) {
              case 'button1':
                await selectAndCopyFile();
                break;
              case 'button2':
                myController.createFolder(context);
                break;
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    ],
    title: const Text("File Manager"),
  );
}

  Future<void> selectAndCopyFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = result.files.first;
      final path = file.path;

      if (path != null) {
        final destinationPath = "${myController.controller.getCurrentPath}/${file.name}";

        await File(path).copy(destinationPath);
        setState(() {});
      }
    }
  }
}
