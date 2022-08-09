import 'package:flutter/material.dart';
import 'package:flutter_application_1/StudentsList.dart';
import 'package:flutter/src/material/date_picker.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  // ignore: non_constant_identifier_names
  final Controller1 = TextEditingController();
  // ignore: non_constant_identifier_names
  final Controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  void onSave() {
    final name = Controller1.text.trim();
    final edad = Controller2.text.trim();
    final hobbie = controller3.text.trim();
    final nacimiento = controller4.text.trim();
    final result = Students(
        name: name,
        edad: int.parse(edad),
        hobbie: hobbie,
        nacimiento: nacimiento);
    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Registrar"),
            ),
            body: Column(
              children: [
                Center(
                    child: Column(children: [
                  TextField(
                      controller: Controller1,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "Nombre", border: OutlineInputBorder())),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFormField(
                    controller: Controller2,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: "EDAD", border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFormField(
                    controller: controller3,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: "Hobbie", border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.calendar_today,
                      size: 26,
                    ),
                    tooltip:
                        'pulse para abrir el calendario y seleccionar la fecha de nacimiento',
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1955, 1),
                        lastDate: DateTime(2025),
                      ).then((pickedDate) {
                        controller4.text =
                            "${pickedDate!.day}-${pickedDate.month}-${pickedDate.year}";
                      });
                    },
                  ),

                  TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: onSave,
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text('Show Dialog'),
                  )

                  // ElevatedButton(
                  // onPressed: onSave, child: const Text("Agregar"))
                ])),
              ],
            )));
  }
}
