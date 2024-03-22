import 'package:intl/intl.dart';

class DateTimeFormatConstant {
  // Jumat, 22 Maret 2024 12:00 AM
  static String getDayDateHours(
    DateTime dateTime,
  ) {
    return DateFormat('EEEE, dd MMMM yyyy h:mm a', 'id_ID').format(
      dateTime,
    );
  }

  // Menghitung Total Hari
  // 60 hari
  static String calculateTotalDay({
    required DateTime firstDate,
    required DateTime? lastDate,
  }) {
    int total = lastDate?.difference(firstDate).inDays ?? 0;
    return '$total Hari';
  }
}
