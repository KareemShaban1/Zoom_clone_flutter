import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
