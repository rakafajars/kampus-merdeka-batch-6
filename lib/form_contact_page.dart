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

  int _selectIndex = -1;

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

  bool isUpdateContact = false;

  @override
  void dispose() {
    phoneController.dispose();
    nameConteroller.dispose();
    super.dispose();
  }

  void _resetVariable() {
    _name = "";
    _phone = "";
    nameConteroller.clear();
    phoneController.clear();
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
                onChanged: (String value) {
                  _name = value;
                  if (_name.isEmpty) {
                    _errorName = 'Username tidak boleh kosong';
                  } else if (_name.length < 2) {
                    _errorName = 'Username harus lebih dari 2 huruf';
                  } else {
                    _errorName = null;
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
                  if (_phone.isEmpty) {
                    _errorPhone = 'Nomor Telepon Tidak Boleh Kosong';
                  } else if (_phone.length < 8) {
                    _errorPhone = 'Nomor Telepon harus lebih 8 huruf';
                  } else {
                    _errorPhone = null;
                  }

                  setState(() {});
                },
                errorText: _errorPhone,
                isValidInputForPhone: true,
                controller: phoneController,
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: validationLogin()
                    ? () {
                        if (isUpdateContact == true) {
                          // PERINTAH UNTUK UPDATE
                          listKontakModel[_selectIndex] = KontakModel(
                            username: _name,
                            phone: _phone,
                          );
                          _resetVariable();
                          _selectIndex = -1;
                          isUpdateContact = false;
                        } else {
                          listKontakModel.add(
                            KontakModel(
                              username: _name,
                              phone: _phone,
                            ),
                          );
                          _resetVariable();
                        }

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
                  child: Text(
                    isUpdateContact == true ? 'Update' : 'Add',
                    style: const TextStyle(
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
                              onTap: () {
                                isUpdateContact = true;
                                nameConteroller.text =
                                    listKontakModel[index].username;
                                phoneController.text =
                                    listKontakModel[index].phone;
                                _name = listKontakModel[index].username;
                                _phone = listKontakModel[index].phone;
                                _errorName = null;
                                _errorPhone = null;
                                _selectIndex = index;

                                setState(() {});
                              },
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
