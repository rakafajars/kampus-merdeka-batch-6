import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/constant/gallery_image_picker_constant.dart';
import 'package:flutter_application_2/constant/name_routes.dart';
import 'package:flutter_application_2/model/task_model.dart';
import 'package:flutter_application_2/page/task_management/create_task_management.dart';
import 'package:flutter_application_2/page/task_management/empty_task_management.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class HomeTaskManagement extends StatefulWidget {
  const HomeTaskManagement({super.key});

  @override
  State<HomeTaskManagement> createState() => _HomeTaskManagementState();
}

class _HomeTaskManagementState extends State<HomeTaskManagement> {
  List<TaskModel> taskModel = [];

  XFile? xFile;

  void addTask(TaskModel value) {
    taskModel.add(value);
    setState(() {});
  }

  void updateTask({
    required TaskModel value,
    required int index,
  }) {
    taskModel[index] = value;
    setState(() {});
  }

  void deleteTask(int index) {
    taskModel.removeAt(index);
    Navigator.pop(context);
    const snackBar = SnackBar(
      content: Text(
        'Task Berhasil dihapus',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Management',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      onTap: () async {
                                        final result =
                                            await GalleryImagePickerConstant
                                                .openCameraGalleryGlobal(
                                          isCamera: true,
                                        );

                                        if (result != null) {
                                          xFile = result;
                                          Navigator.pop(context);

                                          setState(() {});
                                        }
                                      },
                                      leading: const Icon(Icons.camera),
                                      title: const Text(
                                        'Camera',
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () async {
                                        final result =
                                            await GalleryImagePickerConstant
                                                .openCameraGalleryGlobal(
                                          isCamera: false,
                                        );

                                        if (result != null) {
                                          xFile = result;
                                          Navigator.pop(context);
                                          setState(() {});
                                        }
                                      },
                                      leading: const Icon(Icons.image),
                                      title: const Text(
                                        'Gallery',
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: FileImage(
                                  File(xFile?.path ?? ""),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Save',
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.people,
            ),
          ),
        ],
      ),
      body: buildScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
       


          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       title: const Text(
          //         'Input Task',
          //       ),
          //       content: TextFormField(
          //         controller: _formTaskController,
          //         decoration: const InputDecoration(
          //           hintText: 'Masukan Kegiatan Hari Ini',
          //         ),
          //       ),
          //       actions: [
          //         TextButton(
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //           child: const Text(
          //             'Cancel',
          //           ),
          //         ),
          //         TextButton(
          //           onPressed: () {
          //             // tambahkan kondisi empty apabila form masih kosong
          //             // tapi user klik button
          //             if (_formTaskController.text.isNotEmpty) {
          //               addTask(TaskModel(
          //                 id: const Uuid().v1(),
          //                 taskName: _formTaskController.text,
          //               ));
          //               Navigator.pop(context);
          //               _formTaskController.clear();
          //             } else {
          //               const snackBar = SnackBar(
          //                 content: Text(
          //                   'Field Tidak Boleh Kosong!',
          //                 ),
          //               );

          //               ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //             }
          //           },
          //           child: const Text(
          //             'Save',
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget buildScreen() {
    if (taskModel.isNotEmpty) {
      // MUNCULKAN LIST TASK
      return ListView.builder(
        itemCount: taskModel.length,
        itemBuilder: (context, int index) {
          return Container(
            color: Colors.amber,
            child: ListTile(
              onTap: () async {
               

              
              },
              title: Text(
                taskModel[index].taskName,
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Apakah Kamu ingin menghapus task ini?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Tidak',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              deleteTask(index);
                            },
                            child: const Text(
                              'Iya',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                ),
              ),
            ),
          );
        },
      );
    } else {
      return const EmptyTaskManagement();
    }
  }
}
