import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'main.dart';

class BelajarColorPicker extends StatefulWidget {
  const BelajarColorPicker({super.key});

  @override
  State<BelajarColorPicker> createState() => _BelajarColorPickerState();
}

class _BelajarColorPickerState extends State<BelajarColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belajar Color Picker',
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16,
              ),
              color: currentColor,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return PopScope(
                      canPop: false,
                      child: AlertDialog(
                        title: const Text(
                          'Select Color',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Close',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (selectedPicker != null) {
                                currentColor = selectedPicker!;
                                Navigator.pop(context);
                                setState(() {});
                              }
                            },
                            child: const Text(
                              'Save',
                            ),
                          ),
                        ],
                        content: BlockPicker(
                          pickerColor: currentColor,
                          onColorChanged: (value) {
                            selectedPicker = value;
                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  currentColor,
                ),
              ),
              child: const Text(
                'Select Color',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () => MyApp.of(context).changeTheme(ThemeMode.light),
              child: Text('Light')),
          ElevatedButton(
              onPressed: () => MyApp.of(context).changeTheme(ThemeMode.dark),
              child: Text('Dark')),
        ],
      ),
    );
  }
}
