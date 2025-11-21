import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Todo_sharedpreference/Controller_todo.dart';

import '../Note_app/Note_todo.dart';
import 'Todo_list_tile.dart';

class TodoShareUi extends StatelessWidget {
   TodoShareUi({super.key});

  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
final getFunction = Provider.of<Todocontroller>(context);
    TextEditingController todoController = TextEditingController();
    return Scaffold( body: SafeArea(child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 8),
              child: Text(
                "Todo List",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(controller: todoController,
                  decoration: InputDecoration(
                    labelText: "Add a new todo",
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
                onTap: (){
                  getFunction.addNote(todoController.text);
                  todoController.clear();
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.blue,
                  ),
                  child: Center(
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
        ),Expanded(child: ListView.builder(
    itemCount: getFunction.Tododata.length,
    itemBuilder: (context, index) {
    final note = getFunction.Tododata[index];
    final title = note["title"]; "";
    return Todotilee(
    title: title,
    );
    },
    )
    )
      ],
    ),
  )
    );
  }
}
