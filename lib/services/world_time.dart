import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String url;
  late bool isDaytime;

  WorldTime({
    required this.location,
    required this.url,
  });

  Future<void> getTIme() async {
    try {
      http.Response response = await http
          .get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);

      // get indie properties
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "No time available";
    }
  }
}

// test


