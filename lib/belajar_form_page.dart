import 'package:flutter/material.dart';
import 'package:flutter_application_2/widget/text_form_field_custome.dart';

List<String> _statusKawin = [
  'Belum',
  'Sudah Menikah',
  'Duda',
  'Janda',
];

class BelajarFormPage extends StatefulWidget {
  const BelajarFormPage({super.key});

  @override
  State<BelajarFormPage> createState() => _BelajarFormPageState();
}

class _BelajarFormPageState extends State<BelajarFormPage> {
  var formKey = GlobalKey<FormState>();

  String? _name;
  String? nameSubmited;
  String? language;

  TextEditingController _phoneController = TextEditingController();

  bool _check = false;

  int dropdownValue = 0;

  String? _selectedStatusMenikah;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belajar Form Input',
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                TextFormFieldCustome(
                  hintText: 'Username',
                  onChanged: (String value) {
                    _name = value;
                    setState(() {});
                  },
                ),
                // KETIKA USER NAME BELUM DI INPUT, maka icon yang muncul x
                // ketika user sudah di input maka icon ceklis muncul

                const SizedBox(height: 24),
                TextFormFieldCustome(
                  hintText: 'Phone',
                  prefiText: "+62",
                  controller: _phoneController,
                ),
                const SizedBox(height: 24),
                TextFormFieldCustome(
                  hintText: 'Form',
                  onFieldSubmitted: (String value) {
                    nameSubmited = value;
                    setState(() {});
                  },
                ),

                RadioListTile(
                  value: 'Dart',
                  groupValue: language,
                  onChanged: (String? value) {
                    language = value;
                    setState(() {});
                  },
                  title: const Text('Dart'),
                ),
                RadioListTile(
                  value: 'Swift',
                  groupValue: language,
                  onChanged: (String? value) {
                    language = value;
                    setState(() {});
                  },
                  title: const Text('Swift'),
                ),
                CheckboxListTile(
                  value: _check,
                  onChanged: (value) {
                    print("Halo $value");
                    _check = value!;
                    setState(() {});
                  },
                  title: const Text(
                    'Setuju',
                  ),
                ),
                DropdownButton<int>(
                  value: dropdownValue,
                  onChanged: (int? value) {
                    setState(() {
                      dropdownValue = value ?? 0;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('Nol'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('Satu'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('Dua'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('Tiga'),
                    ),
                  ],
                ),
                DropdownButtonFormField<String>(
                  hint: const Text('Pilih Status Menikah'),
                  items: _statusKawin
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    _selectedStatusMenikah = value ?? "-";
                    setState(() {});
                  },
                ),
                Text(
                  _selectedStatusMenikah ?? "-",
                ),
                InkWell(
                  onTap: () {
                    print('Di Tekan');
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
                      'Masuk',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.red;
                        }

                        return Colors.green;
                      },
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'login',
                  ),
                ),
                IconButton(
                  iconSize: 34,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cabin,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
