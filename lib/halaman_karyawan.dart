import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/gallery_image_picker_constant.dart';
import 'package:image_picker/image_picker.dart';

class HalamanKaryawan extends StatefulWidget {
  const HalamanKaryawan({super.key});

  @override
  State<HalamanKaryawan> createState() => _HalamanKaryawanState();
}

class _HalamanKaryawanState extends State<HalamanKaryawan> {
  XFile? xFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          ],
        ),
      ),
    );
  }
}
