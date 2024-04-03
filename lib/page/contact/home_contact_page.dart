import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/name_routes.dart';
import 'package:flutter_application_2/page/contact/archive_contact_page.dart';
import 'package:flutter_application_2/page/contact/model/contact_model.dart';
import 'package:flutter_application_2/page/contact/widget/empty_contact_widget.dart';
import 'package:flutter_application_2/page/contact/widget/item_contact_widget.dart';

class HomeContactPage extends StatefulWidget {
  const HomeContactPage({super.key});

  @override
  State<HomeContactPage> createState() => _HomeContactPageState();
}

class _HomeContactPageState extends State<HomeContactPage> {
  List<ContactModel> dataContact = [
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

  List<ContactModel> listArchiveContact = [];

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
              final result = await Navigator.pushNamed(
                context,
                NameRoutes.archivePageRoute,
                arguments: ArchiveContactArguments(
                  contactModels: listArchiveContact,
                ),
              );
              if (result != null) {
                final contact = result as ContactModel;

                dataContact.add(
                  ContactModel(
                    id: contact.id,
                    imagePath: contact.imagePath,
                    isArchive: false,
                    namaKontak: contact.namaKontak,
                    nomorHandphone: contact.nomorHandphone,
                  ),
                );
                listArchiveContact.remove(contact);

                setState(() {});
              }
            },
            icon: const Icon(
              Icons.archive,
            ),
          ),
        ],
      ),
      body: bodyContact(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            NameRoutes.createEditPageRoute,
          ).then(
            (result) {
              if (result != null) {
                final contact = result as ContactModel;
                dataContact.add(contact);
                setState(() {});
              }
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget bodyContact() {
    if (dataContact.isEmpty) {
      return const EmptyContactWidget();
    } else {
      return ListView.builder(
        itemCount: dataContact.length,
        itemBuilder: (context, index) {
          var data = dataContact[index];

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
                                contactModel: dataContact[index],
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
                                data = ContactModel(
                                  id: data.id,
                                  isArchive: true,
                                  imagePath: dataContact[index].imagePath,
                                  namaKontak: dataContact[index].namaKontak,
                                  nomorHandphone:
                                      dataContact[index].nomorHandphone,
                                );

                                listArchiveContact.add(data);
                                dataContact.removeAt(index);
                                Navigator.pop(context);
                                setState(() {});
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
                  dataContact.removeAt(index);
                  setState(() {});
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
  }

  // cara lain
  // Widget bodyContact() {
  //   if (dataContact.isEmpty) {
  //     return const EmptyContactWidget();
  //   } else {
  //     List<ContactModel> contactNotArchive = [];

  //     for (var element in dataContact) {
  //       if (element.isArchive == false) {
  //         contactNotArchive.add(element);
  //       }
  //     }

  //     return ListView.builder(
  //       // cara 2 dengan method where di dalam list
  //       itemCount: dataContact
  //           .where((element) => element.isArchive == false)
  //           .toList()
  //           .length,
  //       itemBuilder: (context, index) {
  //         return ItemContactWidget(
  //           contactModel: dataContact[index],
  //         );

  //         // itemCount: contactNotArchive.length,
  //         // itemBuilder: (context, index) {
  //         //   return ItemContactWidget(
  //         //     contactModel: contactNotArchive[index],
  //         //   );

  //         // CARA 1
  //         // if (dataContact[index].isArchive == false) {
  //         //   return ItemContactWidget(
  //         //     contactModel: dataContact[index],
  //         //   );
  //         // } else {
  //         //   return const SizedBox();
  //         // }
  //       },
  //     );
  //   }
  // }
}
