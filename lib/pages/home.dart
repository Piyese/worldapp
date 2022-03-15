import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final location = data['location'] as String;
    final time = data['time'];
    final day = data['day'] as bool;

    String bgImg = day ? "day.jpg" : "night.jpg";
    Color fgColor = day ? Colors.black : Colors.white;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(
                  icon: Icon(
                    Icons.location_pin,
                    color: fgColor,
                  ),
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'day': result['day'],
                      };
                    });
                  },
                  label: Text(
                    "Edit Location",
                    style: TextStyle(color: fgColor),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 3.0,
                      color: fgColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time!,
                    style: TextStyle(
                      fontSize: 48.0,
                      letterSpacing: 2.0,
                      color: fgColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
