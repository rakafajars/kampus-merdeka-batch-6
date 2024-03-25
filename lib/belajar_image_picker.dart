import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/gallery_image_picker_constant.dart';
import 'package:flutter_application_2/halaman_karyawan.dart';
import 'package:image_picker/image_picker.dart';

class BelajarImagePicker extends StatefulWidget {
  const BelajarImagePicker({super.key});

  @override
  State<BelajarImagePicker> createState() => _BelajarImagePickerState();
}

class _BelajarImagePickerState extends State<BelajarImagePicker> {

  XFile? xFile;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Image Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Image Name : ${xFile?.path ?? "Belum Ada Gambar"}'),
            xFile?.path != null
                ? Image.file(
                    File(xFile?.path ?? ""),
                  )
                : const SizedBox(),
            ElevatedButton(
              onPressed: () async {
                final result =
                    await GalleryImagePickerConstant.openCameraGalleryGlobal(
                  isCamera: false,
                );

                if (result != null) {
                  xFile = result;
                  setState(() {});
                }
              },
              child: const Text(
                'Gallery',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final result =
                    await GalleryImagePickerConstant.openCameraGalleryGlobal(
                  isCamera: true,
                );

                if (result != null) {
                  xFile = result;
                  setState(() {});
                }
              },
              child: const Text(
                'Camera',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HalamanKaryawan();
                    },
                  ),
                );
              },
              child: const Text(
                'Data Karyawan',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
