import 'package:flutter/material.dart';

import 'package:flutter_application_1/StudentsList.dart';
import 'package:flutter_application_1/information.dart';

import 'package:flutter_application_1/objectbox.g.dart';

import 'package:flutter_application_1/text_box.dart';
import 'package:flutter_application_1/HomePage.dart';

class RegisterContact extends StatefulWidget {
  const RegisterContact(
      {required this.boxstudent, required this.estudiante, Key? key})
      : super(key: key);
  final Box<Students> boxstudent;
  final Students estudiante;
  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<RegisterContact> {
  final Controller1 = TextEditingController();
  // ignore: non_constant_identifier_names
  final Controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  @override
  void initState() {
    Controller1.text = widget.estudiante.name;
    Controller2.text = widget.estudiante.edad.toString();
    controller3.text = widget.estudiante.hobbie;
    controller4.text = widget.estudiante.nacimiento;

    super.initState();
  }

  void ondelete() {
    widget.boxstudent.remove(widget.estudiante.id);

    Navigator.of(context).pop();
  }

  void actualizar() {
    widget.estudiante.name = Controller1.text;
    widget.estudiante.edad = int.parse(Controller2.text);
    widget.estudiante.hobbie = controller3.text;
    widget.estudiante.nacimiento = controller4.text;
    widget.boxstudent.put(widget.estudiante);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Modificar datos"),
        ),
        body: Center(
          child: ListView(
            children: [
              TextBox(Controller1, "nombre"),
              TextBox(Controller2, "edad"),
              TextBox(controller3, "hobbie"),
              TextBox(controller4, "fecha nacimiento"),
              ElevatedButton(
                onPressed: () {
                  actualizar();
                },
                child: const Text("guardar datos"),
              ),
              ElevatedButton(
                  onPressed: () {
                    ondelete();
                  },
                  child: const Text("eliminar registro"))
            ],
          ),
        ));
  }
}
