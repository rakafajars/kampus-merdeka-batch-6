import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';

class BelajarFilePicker extends StatefulWidget {
  const BelajarFilePicker({super.key});

  @override
  State<BelajarFilePicker> createState() => _BelajarFilePickerState();
}

class _BelajarFilePickerState extends State<BelajarFilePicker> {
  PlatformFile? selectedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar File Picker'),
      ),
      body: Column(
        children: [
          const Text('Select File'),
          Text(selectedFile?.path ?? "Belum Ada File yang dipilh"),
          ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text(
              'Picked File',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedFile != null) {
                _openFile(selectedFile!);
              } else {
                const snackBar = SnackBar(
                  content: Text(
                    'Kamu Belum Memilih File!',
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text(
              'Open File',
            ),
          )
        ],
      ),
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'pdf',
      ],
    );
    if (result == null) {
      return;
    }

    selectedFile = result.files.first;

    setState(() {});
  }

  void _openFile(PlatformFile file) {
    OpenFilex.open(file.path);
  }
}
