import 'package:flutter/material.dart';
import 'package:learningflutter2/views/home_screen.dart';

void main() => runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: const Color.fromARGB(255, 18, 17, 17),
    scaffoldBackgroundColor: const Color.fromARGB(255, 33, 33, 33),
    brightness: Brightness.dark,
  ),
  home: const Home(),
));
