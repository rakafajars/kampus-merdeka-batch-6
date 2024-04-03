import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/contact/model/contact_model.dart';
import 'package:flutter_application_2/page/contact/widget/empty_contact_widget.dart';
import 'package:flutter_application_2/page/contact/widget/item_contact_widget.dart';

class ArchiveContactArguments {
  final List<ContactModel> contactModels;

  ArchiveContactArguments({required this.contactModels});
}

class ArchiveContactPage extends StatefulWidget {
  const ArchiveContactPage({
    super.key,
  });

  @override
  State<ArchiveContactPage> createState() => _ArchiveContactPageState();
}

class _ArchiveContactPageState extends State<ArchiveContactPage> {
  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as ArchiveContactArguments?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive Contact'),
      ),
      body: bodyContact(
        contactModel: routes?.contactModels,
      ),
    );
  }

  Widget bodyContact({
    required List<ContactModel>? contactModel,
  }) {
    if (contactModel?.isEmpty == true || contactModel == null) {
      return const EmptyContactWidget();
    } else {
      return ListView.builder(
        itemCount: contactModel.length,
        itemBuilder: (context, int index) {
          var data = contactModel[index];
          return ItemContactWidget(
            contactModel: data,
          );
        },
      );
    }
  }
}
