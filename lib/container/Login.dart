import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_quizz/container/Signup.dart';
import 'package:music_quizz/container/start_quizz.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
  }) : super(key: key);

    @override
  Widget build(BuildContext context) {
    const appTitle = 'Connexion';

    return MaterialApp(
      title: appTitle,
      
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
   final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
               keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },

              decoration:InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), hintText: "email"),
      
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              decoration:InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), hintText: "Mot de passe"),
      
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "";
                }
                return null;
              },
            ),
          ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    minimumSize: const Size.fromHeight(45)),
                child: const Text("Se connecter"),
                onPressed: () async {
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (contex) => const StartQuizz(),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                            title: const Text("Mot de passe ou email incorrect"),
                          content: Text('${e.message}')),
                      );
                    }
                  }
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    minimumSize: const Size.fromHeight(45)),
                child: const Text("Pas encore inscrit ? Rejoignez nous !"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (contex) => const SignIn(),
                    ),
                  );
                }),
              ),
        ],
      ),
    );
  }
}
