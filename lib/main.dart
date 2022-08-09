import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/infostudent.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: "Loggin",
        routes: {
          "Loggin": (context) => login_form(),
          "HomePage": (context) => const HomePage(),
          "infostudent": (context) => const Prueba(),
        });
  }
}
