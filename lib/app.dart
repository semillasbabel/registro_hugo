import 'package:flutter/material.dart';

class login_form extends StatefulWidget {
  login_form({Key? key}) : super(key: key);

  @override
  State<login_form> createState() => _login_formState();
}

class _login_formState extends State<login_form> {
  late String _nombre;
  late String _password;

  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 90.0,
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: Image.network(
                    "https://icon-library.com/images/icon-logo-png/icon-logo-png-11.jpg"),
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontFamily: "cursive",
                  fontSize: 50.0,
                ),
              ),
              TextField(
                enableInteractiveSelection: false,
                textCapitalization: TextCapitalization.words,
                autofocus: true,
                controller: txtUser,
                decoration: const InputDecoration(
                    labelText: "Nombre de usuario",
                    suffixIcon: Icon(Icons.verified_user_sharp),
                    border: OutlineInputBorder()),
              ),
              const Divider(
                height: 7,
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                textCapitalization: TextCapitalization.words,
                autofocus: true,
                controller: txtPassword,
                decoration: const InputDecoration(
                    labelText: "Contraseña",
                    suffixIcon: Icon(Icons.password_sharp),
                    border: OutlineInputBorder()),
              ),
              const Divider(
                height: 10.0,
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      validacion();
                    },
                    child: const Text("entrar")),
              ),
              const Divider(
                height: 10.0,
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      entrar();
                    },
                    child: const Text("registrarse")),
              )
            ],
          ),
        ],
      ),
    );
  }

  void validacion() {
    Navigator.popAndPushNamed(context, "HomePage");

    //Navigator.pushNamed(context, "Homepage");
  }

  void entrar() {
    Navigator.popAndPushNamed(context, "infostudent");
  }
}
