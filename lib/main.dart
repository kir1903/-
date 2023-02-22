import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project/scenes/home.dart';
import 'package:project/scenes/Main.dart';

bool userauth = false;
void main() => runApp(MaterialApp(
  theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/Main': (context) => Main(),
  },
));

