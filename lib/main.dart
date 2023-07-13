import 'package:flutter/material.dart';
import 'package:game/screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Screen(),
    ),
  ));
}
