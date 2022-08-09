// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/StudentsList.dart';
import 'package:flutter_application_1/information.dart';

import 'package:flutter_application_1/modifycontac.dart';
import 'package:flutter_application_1/objectbox.g.dart';
import 'package:flutter_application_1/app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final studentlist = <Students>[];
  late final Store store;
  late final Box<Students> studentBox;

  Future<void> loadStore() async {
    store = await openStore();
    studentBox = store.box<Students>();
    loadStudents();
  }

  void loadStudents() {
    studentlist.clear();
    setState(() {
      studentlist.addAll(studentBox.getAll());
    });
  }

  @override
  void initState() {
    loadStore();
    super.initState();
  }

  Future<void> addStudent() async {
    final result = await showDialog(
      context: context,
      builder: (context) => const AddStudentScreen(),
    );
    if (result != null && result is Students) {
      studentBox.put(result);
      loadStudents();
    }
  }

  void verInfo(Students estudiante) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => RegisterContact(
              boxstudent: studentBox,
              estudiante: estudiante,
            )));
    setState(() {
      loadStudents();
    });
  }

  void ondelete(int id) {
    studentBox.remove(id);
    setState(() {
      loadStudents();
    });
  }

  void closedb() {
    store.close();
    Navigator.popAndPushNamed(context, "Loggin");
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: () {
          closedb();
        },
      )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: studentlist.length,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                    title: Text(
                      " Nombre: ${studentlist[i].name} Edad: ${studentlist[i].edad} Hobiie:  ${studentlist[i].hobbie}   Fecha Nacimiento: ${studentlist[i].nacimiento}",
                    ),
                    tileColor: Color.fromARGB(255, 157, 192, 192),
                    leading: const Icon(
                      Icons.person_rounded,
                      color: Colors.redAccent,
                    ),
                    onTap: () {
                      // ondelete(studentlist[i].id);
                      verInfo(studentlist[i]);
                    });
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: addStudent, label: const Text("Agregar Estudiante")),
    );
  }
}
