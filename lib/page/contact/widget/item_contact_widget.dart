import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/contact/model/contact_model.dart';

class ItemContactWidget extends StatelessWidget {
  final ContactModel? contactModel;
  final Function()? onLongPress;
  const ItemContactWidget({
    super.key,
    required this.contactModel,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      leading: CircleAvatar(
        backgroundImage: fileImageContact(),
        child: imageContact()
      ),
      title: Text(
        contactModel?.namaKontak ?? "-",
      ),
      subtitle: Text(
        contactModel?.nomorHandphone ?? "-",
      ),
      trailing: Visibility(
        visible: contactModel?.isArchive == true,
        child: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              contactModel,
            );
          },
          icon: const Icon(Icons.undo_sharp),
        ),
      ),
    );
  }

  Widget imageContact() {
    if (contactModel?.imagePath == null ||
        contactModel?.imagePath == "" ||
        contactModel?.imagePath?.isEmpty == true) {
      return Text(
        contactModel?.namaKontak?[0] ?? "",
      );
    } else {
      return const SizedBox();
    }
  }

  FileImage? fileImageContact() {
    if (contactModel?.imagePath == null ||
        contactModel?.imagePath == "" ||
        contactModel?.imagePath?.isEmpty == true) {
      return null;
    } else {
      return FileImage(
        File(
          contactModel?.imagePath ?? "",
        ),
      );
    }
  }
}
