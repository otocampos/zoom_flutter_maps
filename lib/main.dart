import 'package:flutter/material.dart';
import 'package:zoom_flutter/Pages/MapScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/maps",
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {"/maps":(context) => const MapScreen()},
    );
  }
}