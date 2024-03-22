import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/date_time_format_constant.dart';

class BelajarDatePicker extends StatefulWidget {
  const BelajarDatePicker({super.key});

  @override
  State<BelajarDatePicker> createState() => _BelajarDatePickerState();
}

class _BelajarDatePickerState extends State<BelajarDatePicker> {
  var awalDate = DateTime.now();

  DateTime? akhirDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widget'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: ListView(
          children: [
            // BuildDatePicker
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Awal Date :'),
                    TextButton(
                      onPressed: () async {
                        DateTime? selectDate = await showDatePicker(
                          context: context,
                          initialDate: awalDate,
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                        );

                        if (selectDate != null) {
                          awalDate = selectDate;
                        }

                        setState(() {});
                      },
                      child: const Text(
                        'Select',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  DateTimeFormatConstant.getDayDateHours(
                    awalDate,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Target Date :'),
                    TextButton(
                      onPressed: () async {
                        DateTime? selectDate = await showDatePicker(
                          context: context,
                          initialDate: akhirDate,
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                        );

                        if (selectDate != null) {
                          akhirDate = selectDate;
                        }

                        setState(() {});
                      },
                      child: const Text(
                        'Select',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  akhirDate != null
                      ? DateTimeFormatConstant.getDayDateHours(
                          akhirDate!,
                        )
                      : "-",
                ),
                Text(
                  DateTimeFormatConstant.calculateTotalDay(
                    firstDate: awalDate,
                    lastDate: akhirDate,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
