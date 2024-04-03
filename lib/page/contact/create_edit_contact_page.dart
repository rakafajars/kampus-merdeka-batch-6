import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/constant/gallery_image_picker_constant.dart';
import 'package:flutter_application_2/page/contact/model/contact_model.dart';
import 'package:flutter_application_2/widget/text_form_field_custome.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class CreateEditContactPage extends StatefulWidget {
  const CreateEditContactPage({super.key});

  @override
  State<CreateEditContactPage> createState() => _CreateEditContactPageState();
}

class _CreateEditContactPageState extends State<CreateEditContactPage> {
  TextEditingController nameConteroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  XFile? xFile;

  @override
  void dispose() {
    phoneController.dispose();
    nameConteroller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Contact',
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () async {
                                final result = await GalleryImagePickerConstant
                                    .openCameraGalleryGlobal(
                                  isCamera: true,
                                );

                                if (result != null) {
                                  xFile = result;
                                  setState(() {});
                                }
                              },
                              leading: const Icon(
                                Icons.camera,
                              ),
                              title: const Text('Camera'),
                            ),
                            ListTile(
                              onTap: () async {
                                final result = await GalleryImagePickerConstant
                                    .openCameraGalleryGlobal(
                                  isCamera: false,
                                );

                                if (result != null) {
                                  xFile = result;
                                  setState(() {});
                                }
                              },
                              leading: const Icon(
                                Icons.image,
                              ),
                              title: const Text('Gambar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 42,
                    backgroundImage: xFile?.path != null
                        ? FileImage(File(
                            xFile?.path ?? "",
                          ))
                        : null,
                    child: xFile?.path != null
                        ? const SizedBox()
                        : const Icon(
                            Icons.camera,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormFieldCustome(
                hintText: 'Username',
                controller: nameConteroller,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Username tidak boleh kosong';
                  } else if ((value?.length ?? 0) < 2) {
                    return 'Username harus lebih dari 2 huruf';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormFieldCustome(
                hintText: 'Phone',
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Nomor Telepon Tidak Boleh Kosong';
                  } else if ((value?.length ?? 0) < 8) {
                    return 'Nomor Telepon harus lebih dari 8 huruf';
                  }

                  return null;
                },
                isValidInputForPhone: true,
                controller: phoneController,
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(
                      context,
                      ContactModel(
                          id: const Uuid().v1(),
                          imagePath: xFile != null ? xFile?.path : '',
                          isArchive: false,
                          namaKontak: nameConteroller.text,
                          nomorHandphone: phoneController.text),
                    );

                    nameConteroller.clear();
                    phoneController.clear();
                  }

                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        100,
                      ),
                    ),
                    color: Color(
                      0xFF45DFC3,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Add Pake Form',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
