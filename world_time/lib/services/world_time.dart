import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    try {
      var response =
          await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      var data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.split(":").first)));

      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'could not get time';
    }
  }
}
