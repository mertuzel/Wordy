import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class StringUtils {
  static String getPublishDateLong(DateTime date) {
    final DateTime currentTime = DateTime.now();
    final difference = currentTime.difference(date);
    initializeDateFormatting('tr_TR');
    if (difference.inDays > 365) {
      return DateFormat('d MMMM yyyy', 'tr_TR').format(date);
    } else if (difference.inDays > 8) {
      return DateFormat('d MMMM', 'tr_TR').format(date);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return "1 Hafta Önce";
    } else if (difference.inDays >= 2) {
      return "${difference.inDays} Gün Önce";
    } else if (difference.inDays >= 1) {
      return "1 Gün Önce";
    } else if (difference.inHours >= 2) {
      return "${difference.inHours} Saat Önce";
    } else if (difference.inHours >= 1) {
      return "1 Saat Önce";
    } else if (difference.inMinutes >= 2) {
      return "${difference.inMinutes} Dakika Önce";
    } else if (difference.inMinutes >= 1) {
      return "1 Dakika Önce";
    } else if (difference.inSeconds >= 3) {
      return "${difference.inSeconds} Saniye Önce";
    } else {
      return "Az Önce";
    }
  }
}
