import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/contact/model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  final List<ContactModel> _dataContact = [
    ContactModel(
      imagePath: null,
      isArchive: false,
      namaKontak: 'Raka',
      nomorHandphone: '08722322',
      id: "0",
    ),
    ContactModel(
      imagePath: null,
      isArchive: false,
      namaKontak: 'Rai',
      nomorHandphone: '08722321112',
      id: "1",
    ),
    ContactModel(
      imagePath: null,
      isArchive: false,
      namaKontak: 'Riko',
      nomorHandphone: '0872232111112',
      id: "2",
    ),
  ];

  List<ContactModel> get dataContact => _dataContact;

  final List<ContactModel> _listArchiveContact = [];
  List<ContactModel> get listArchiveContact => _listArchiveContact;

  void addContact(ContactModel contactModel) {
    _dataContact.add(contactModel..isArchive = false);
    _listArchiveContact.remove(contactModel);
    notifyListeners();
  }

  void addContactArchive(ContactModel contactModel) {
    _listArchiveContact.add(contactModel..isArchive = true);
    _dataContact.remove(contactModel);
    notifyListeners();
  }

  void deleteContact(int index) {
    _dataContact.removeAt(index);
    notifyListeners();
  }
}
