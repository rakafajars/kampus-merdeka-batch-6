import 'package:flutter/material.dart';
import 'package:flutter_application_2/widget/text_form_field_custome.dart';

class FormContactPage extends StatefulWidget {
  const FormContactPage({super.key});

  @override
  State<FormContactPage> createState() => _FormContactPageState();
}

class _FormContactPageState extends State<FormContactPage> {
  String _name = "";
  String? _errorName;

  String _phone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Contact',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormFieldCustome(
                hintText: 'Username',
                onChanged: (String value) {
                  _name = value;
                  if (_name.length > 2) {
                    _errorName = null;
                  } else if (_name.isEmpty) {
                    _errorName = 'Username tidak boleh kosong';
                  } else {
                    _errorName = 'Username harus lebih dari 2 kata';
                  }
                  setState(() {});
                },
                errorText: _errorName,
              ),
              const SizedBox(height: 24),
              TextFormFieldCustome(
                hintText: 'Phone',
                onChanged: (String value) {
                  _phone = value;
                  setState(() {});
                },
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: _name != "" && _phone != "" && _errorName == null
                    ? () {
                        print('Di Tekan');
                      }
                    : null,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        100,
                      ),
                    ),
                    color: _name != "" && _phone != "" && _errorName == null
                        ? const Color(
                            0xFF45DFC3,
                          )
                        : Colors.grey,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Masuk',
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
