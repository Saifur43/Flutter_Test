import 'dart:convert';
import 'package:http/http.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<String> getData() async {
    var response =
        await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
    var data = jsonDecode(response.body);
    print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'];

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset.split(":").first)));

    time = now.toString();
    return time;
  }
}
