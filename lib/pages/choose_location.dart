import 'package:flutter/material.dart';
import 'package:worldapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> wt = [
    WorldTime(location: "Tokyo", url: "Asia/Tokyo"),
    WorldTime(location: "Nairobi", url: "Africa/Nairobi"),
    WorldTime(location: "London", url: "Europe/London"),
    WorldTime(location: "Kampala", url: "Africa/Kampala"),
    WorldTime(location: "Beijing", url: "Asia/Beijing"),
    WorldTime(location: "Sydney", url: "Australia/Sydney"),
    WorldTime(location: "Accra", url: "Africa/Accra"),
    WorldTime(location: "Chicago", url: "America/Chicago"),
  ];

  void updateTime(index) async {
    WorldTime instance = wt[index];
    await instance.getTIme();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'day': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 241, 242),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 193, 226),
        title: const Text("Choose a Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: wt.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(wt[index].location),
            ),
          );
        },
      ),
    );
  }
}
