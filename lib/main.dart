
import 'package:flutter/material.dart';
import 'package:project/scenes/home.dart';
import 'package:project/scenes/Main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/firebase_options.dart';






bool userauth = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
    },
  ));
}
