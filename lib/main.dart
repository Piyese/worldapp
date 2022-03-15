import 'package:flutter/material.dart';
import 'package:worldapp/pages/choose_location.dart';
import 'package:worldapp/pages/home.dart';
import 'package:worldapp/pages/loading.dart';

void main() => runApp(MaterialApp(
      // onGenerateRoute: (settings) => {
      // if (settings.name == '/home'){
      //
      // }
      // },
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
