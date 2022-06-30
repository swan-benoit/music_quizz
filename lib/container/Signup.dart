import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_quizz/container/Login.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

    @override
  Widget build(BuildContext context) {
    const appTitle = 'Création du compte';

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
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

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
                email = value.toString().trim();
              },
              decoration:InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), hintText: "Email"),
      
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
              decoration:InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), hintText: "Mot de passe"),
      
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter Password";
                }
              },
              onChanged: (value) {
                password = value;
              },
            ),
          ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      minimumSize: const Size.fromHeight(45)),
                  child: Text("S'enregistrer"),
                  onPressed: () async {
                    try {
                        await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        print("tersdhf");
                          // ignore: use_build_context_synchronously
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new Login())
                        );

                    } catch(e) {
                      print(e);
                    }     

                  },
                ),
              ),

                            Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      minimumSize: const Size.fromHeight(45)),
                  child: Text("Se connecter"),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (contex) => Login(),
                      ),
                    );
                  }
                ),
              ),
              
        ],
      ),
    );
  }
}