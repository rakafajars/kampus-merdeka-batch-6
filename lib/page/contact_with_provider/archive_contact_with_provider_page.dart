import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/contact/model/contact_model.dart';
import 'package:flutter_application_2/page/contact/widget/empty_contact_widget.dart';
import 'package:flutter_application_2/page/contact/widget/item_contact_widget.dart';
import 'package:flutter_application_2/page/contact_with_provider/contact_provider.dart';
import 'package:provider/provider.dart';

class ArchiveContactWithProviderPage extends StatefulWidget {
  const ArchiveContactWithProviderPage({super.key});

  @override
  State<ArchiveContactWithProviderPage> createState() =>
      _ArchiveContactWithProviderPageState();
}

class _ArchiveContactWithProviderPageState
    extends State<ArchiveContactWithProviderPage> {
  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive Contact'),
      ),
      body: bodyContact(contactProvider),
    );
  }

  Widget bodyContact(ContactProvider contactProvider) {
    if (contactProvider.listArchiveContact.isEmpty == true) {
      return const EmptyContactWidget();
    } else {
      return ListView.builder(
        itemCount: contactProvider.listArchiveContact.length,
        itemBuilder: (context, int index) {
          var data = contactProvider.listArchiveContact[index];
          return ItemContactWidget(
            contactModel: data,
          );
        },
      );
    }
  }
}
