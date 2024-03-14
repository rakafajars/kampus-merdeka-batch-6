import 'package:flutter/material.dart';

class ContactModel {
  final String name;
  final int phone;

  ContactModel({required this.name, required this.phone});
}

class BelajarListViewBiasaPage extends StatelessWidget {
  List<ContactModel> listContactModel = [
    ContactModel(
      name: 'Adr',
      phone: 081122222,
    ),
    ContactModel(
      name: 'aaad',
      phone: 081122222,
    ),
    ContactModel(
      name: 'aaad',
      phone: 08112213212222,
    ),
    ContactModel(
      name: 'aaa12d',
      phone: 0811221113212222,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belajar List View',
        ),
      ),
      // body: ListView.separated(
      //   itemCount: listContactModel.length,
      //   itemBuilder: (context, int index) {
      //     return SizedBox(
      //       height: 50,
      //       width: 100,
      //       child: Column(
      //         children: [
      //           Text(listContactModel[index].name),
      //           Text(
      //             listContactModel[index].phone.toString(),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      //   separatorBuilder: (context, int index) {
      //     return const Divider();
      //   },
      // ),
      // body: ListView.builder(
      //   itemCount: listContactModel.length,
      //   itemBuilder: (context, int index) {
      //     return Column(
      //       children: [
      //         Text(listContactModel[index].name),
      //         Text(
      //           listContactModel[index].phone.toString(),
      //         ),
      //         const Divider(
      //           indent: 10,
      //           endIndent: 10,
      //         ),
      //         Container(
      //           margin: EdgeInsets.symmetric(horizontal: 10),
      //           height: 0.5,
      //           width: double.infinity,
      //           color: Colors.red,
      //         ),
      //       ],
      //     );
      //   },
      // ),
      // body: Column(
      //   children: [
      //     SizedBox(
      //       height: 100,
      //       child: ListView(
      //         physics: const BouncingScrollPhysics(),
      //         scrollDirection: Axis.horizontal,
      //         children: listContactModel.map((e) {
      //           return Container(
      //             height: 50,
      //             width: 100,
      //             color: Colors.red,
      //             child: Column(
      //               children: [
      //                 Text(e.name),
      //                 Text(
      //                   e.phone.toString(),
      //                 ),
      //               ],
      //             ),
      //           );
      //         }).toList(),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
