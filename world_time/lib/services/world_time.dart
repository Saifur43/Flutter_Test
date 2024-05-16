import 'dart:convert';
import 'package:http/http.dart';

class WorldTime{
  String location;
  late String time;
  String flag;
  String url;
  
  WorldTime({required this.location, required this.flag, required this.url});
  
  
  Future<void> getData() async {
    
    Response response = await get("https://worldtimeapi.org/api/timezone/$url" as Uri);
    Map data = jsonEncode(response.body) as Map;
    
    String datetime = data['datetime'];
    String offset = data['offset'];

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString();
    print(time);
  }

}

