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
