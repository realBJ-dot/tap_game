import 'package:flutter/material.dart';
import 'screens/tapper_page.dart';  

void main() {
  runApp(const MyApp());
}
// main file where we launch the whole app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tapper App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TapperPage(),
    );
  }
}
