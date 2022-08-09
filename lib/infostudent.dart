import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/StudentsList.dart';
import 'package:flutter_application_1/information.dart';

import 'package:flutter_application_1/modifycontac.dart';
import 'package:flutter_application_1/objectbox.g.dart';
import 'package:flutter_application_1/app.dart';

class Prueba extends StatefulWidget {
  const Prueba({Key? key}) : super(key: key);

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text("Prueba"),
      ),
      body: Column(),
    );
  }
}
