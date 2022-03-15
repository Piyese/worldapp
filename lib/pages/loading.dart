import 'package:worldapp/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  get controller => null;

  void setupWorldTime() async {
    WorldTime insta = WorldTime(location: "Berlin", url: "Europe/Berlin");
    await insta.getTIme();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': insta.location,
      'time': insta.time,
      'day': insta.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Color.fromARGB(255, 208, 73, 73),
          size: 50.0,
        ),
      ),
    );
  }
}
