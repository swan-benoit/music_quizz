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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text("Mes Notes", style: TextStyle(fontSize: 30)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Titre",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                minLines: 4,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(hintText: "Contenu"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 8, left: 8, top: 16, bottom: 8),
              child: ElevatedButton(
                  onPressed: takePhoto, child: const Text("Ajouter un photo")),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
              child: SizedBox(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: addNote, child: const Text("Ajouter ma note")),
              ),
            )
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
