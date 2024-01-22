import 'package:intl/intl.dart';

String formateDate(String inputString) {
  DateTime dateTime =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parseUtc(inputString);

// Convert to local time
  DateTime localDateTime = dateTime.toLocal();

// Format the date and time
  String formattedDateTime =
      DateFormat("yyyy-MM-dd HH:mm").format(localDateTime);
  return formattedDateTime;
}
