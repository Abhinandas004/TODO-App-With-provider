import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Note_todo.dart';
import 'note_controller.dart';

class NoteAppUi extends StatelessWidget {
  NoteAppUi({super.key});

  final TextEditingController _noteTextController = TextEditingController();
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "MY NOTE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _noteTextController,
                    decoration: InputDecoration(
                      labelText: "Add a note",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    noteController.addNote(_noteTextController.text.trim());
                    _noteTextController.clear();
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: noteController.notes.length,
                itemBuilder: (context, index) {
                  final note = noteController.notes[index];
                  final title = note["title"]; "";
                  return Todotilee(
                    title: title,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
