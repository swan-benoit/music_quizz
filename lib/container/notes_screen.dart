import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.green),
        body: Column(
          children: [
            const Text("Mes Notes", style: TextStyle(fontSize: 30)),
            const TextField(
              decoration: InputDecoration(
                hintText: "Titre",
              ),
            ),
            const TextField(
              minLines: 4,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(hintText: "Contenu"),
            ),
            ElevatedButton(
                onPressed: takePhoto, child: const Text("Ajouter un photo")),
            ElevatedButton(
                onPressed: addNote, child: const Text("Ajouter ma note"))
          ],
        ));
  }

  void takePhoto() {
    print('take photo');
    //  TODO implement me
  }

  void addNote() {
    print('add note');
    //  TODO implement me
  }
}
