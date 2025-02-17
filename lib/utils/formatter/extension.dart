import 'package:intl/intl.dart';

List<Map<String, String>> getAllDate() {
  DateTime now = DateTime.now();

  int bulan = now.month;
  int tahun = now.year;

  DateTime akhirBulan = DateTime(tahun, bulan + 1, 0);

  List<Map<String, String>> tanggalList = [];

  for (int i = 1; i <= akhirBulan.day; i++) {
    DateTime currentDate = DateTime(tahun, bulan, i);

    String hari = DateFormat('EEE').format(currentDate);
    String tanggal = DateFormat('dd').format(currentDate);
    String bulanString = DateFormat('MMMM').format(currentDate);

    tanggalList.add({
      'day': hari,
      'date': tanggal,
      'month': bulanString,
      'year': tahun.toString(),
    });
  }

  return tanggalList;
}

extension DateTimeFormatter on DateTime {
  String toCustomDateFormat() {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    return '${day.toString().padLeft(2, '0')} ${months[month - 1]} ${year.toString().substring(2, 4)}';
  }
}

extension DateTimeFormat on DateTime {
  String toFormattedString() {
    String year = this.year.toString();
    String month = this.month.toString().padLeft(2, '0');
    String day = this.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }
}
