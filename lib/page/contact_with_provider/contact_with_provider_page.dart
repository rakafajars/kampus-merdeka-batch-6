import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/name_routes.dart';
import 'package:flutter_application_2/page/contact/widget/empty_contact_widget.dart';
import 'package:flutter_application_2/page/contact/widget/item_contact_widget.dart';
import 'package:flutter_application_2/page/contact_with_provider/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactWithProviderPage extends StatefulWidget {
  const ContactWithProviderPage({super.key});

  @override
  State<ContactWithProviderPage> createState() =>
      _ContactWithProviderPageState();
}

class _ContactWithProviderPageState extends State<ContactWithProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushNamed(
                context,
                NameRoutes.archivePageRoute,
              );
            },
            icon: const Icon(
              Icons.archive,
            ),
          ),
        ],
      ),
      body: bodyContact(),
    );
  }

  Widget bodyContact() {
    return Consumer<ContactProvider>(
      builder: (BuildContext context, ContactProvider value, Widget? child) {
        if (value.dataContact.isEmpty) {
          return const EmptyContactWidget();
        } else {
          return ListView.builder(
            itemCount: value.dataContact.length,
            itemBuilder: (context, index) {
              var data = value.dataContact[index];

              return Row(
                children: [
                  Expanded(
                    child: ItemContactWidget(
                      contactModel: data,
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Apakah kamu yakin untuk archive kontak ini ?',
                                  ),
                                  ItemContactWidget(
                                    contactModel: data,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Tidak'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    value.addContactArchive(
                                      data,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ya'),
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      value.deleteContact(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  )
                ],
              );
            },
          );
        }
      },
    );
  }
}
