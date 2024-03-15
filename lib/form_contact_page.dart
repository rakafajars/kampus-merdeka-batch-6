import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widget/text_form_field_custome.dart';

// class ini digunakan untuk menampung nilai dari
// username field dan phone field
// ketika button add di tekan
class KontakModel {
  final String username;
  final String phone;

  KontakModel({
    required this.username,
    required this.phone,
  });
}

class FormContactPage extends StatefulWidget {
  const FormContactPage({super.key});

  @override
  State<FormContactPage> createState() => _FormContactPageState();
}

class _FormContactPageState extends State<FormContactPage> {
  String _name = "";
  TextEditingController nameConteroller = TextEditingController();
  String? _errorName;
  String? _errorPhone;

  String _phone = "";
  TextEditingController phoneController = TextEditingController();

  String? languange;

  // function boolean dari hasil _name, _phone, _errorName, errorPhone
  bool validationLogin() {
    return _name != "" &&
        _phone != "" &&
        _errorName == null &&
        _errorPhone == null;
  }

  final _formKey = GlobalKey<FormState>();

  // BUAT OBJECT LIST UNTUK MENAMPILKAN USER CONTACT
  List<KontakModel> listKontakModel = [];

  @override
  void dispose() {
    phoneController.dispose();
    nameConteroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Contact',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

                // onChanged: (String value) {
                //   _name = value;
                //   if (_name.isEmpty) {
                //     _errorName = 'Username tidak boleh kosong';
                //   } else if (_name.length < 2) {
                //     _errorName = 'Username harus lebih dari 2 huruf';
                //   } else {
                //     _errorName = null;
                //   }
                //   setState(() {});
                // },
                // errorText: _errorName,
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
                // onChanged: (String value) {
                //   _phone = value;
                //   if (_phone.isEmpty) {
                //     _errorPhone = 'Nomor Telepon Tidak Boleh Kosong';
                //   } else if (_phone.length < 8) {
                //     _errorPhone = 'Nomor Telepon harus lebih 8 huruf';
                //   } else {
                //     _errorPhone = null;
                //   }

                //   setState(() {});
                // },
                // errorText: _errorPhone,
                isValidInputForPhone: true,
                controller: phoneController,
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    listKontakModel.add(
                      KontakModel(
                        username: nameConteroller.text,
                        phone: phoneController.text,
                      ),
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
              const SizedBox(height: 24),
              InkWell(
                onTap: validationLogin()
                    ? () {
                        // if (_formKey.currentState!.validate()) {
                        //   print('Di Tekan');
                        // }

                        listKontakModel.add(
                          KontakModel(
                            username: _name,
                            phone: _phone,
                          ),
                        );

                        _name = "";
                        _phone = "";
                        nameConteroller.clear();
                        phoneController.clear();

                        setState(() {});
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
                    color: validationLogin()
                        ? const Color(
                            0xFF45DFC3,
                          )
                        : Colors.grey,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Daftar Kontak',
              ),
              Expanded(
                child: listKontakModel.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.contact_emergency,
                              size: 24,
                            ),
                            Text(
                              'Kontak Kosong',
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: listKontakModel.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              bottom: 16,
                              right: 16,
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                child: Text(
                                  listKontakModel[index].username[0],
                                ),
                              ),
                              title: Text(
                                listKontakModel[index].username,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                listKontakModel[index].phone,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  listKontakModel.remove(
                                    listKontakModel[index],
                                  );
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
