import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Counter_provider.dart';
import 'package:state_management/Todo/TodoTile.dart';
import 'package:state_management/Todo/Todo_provider.dart';

class TodoHome extends StatelessWidget {
   TodoHome({super.key});

   TextEditingController todoController =TextEditingController();
   TextEditingController updateCtr =TextEditingController();

  @override
  Widget build(BuildContext context) {

    final getData = Provider.of<Todoprovider>(context);
    final getFunction = Provider.of<Todoprovider>(context,listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8),
                  child: Text(
                    "Todo List Lite",
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
                        getFunction.addData(todoController.text);
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
              itemCount: getData.datas.length,
              itemBuilder: (context,index) {
                return Todotile(
                  updateCtr: updateCtr,
                    checkValue: getData.datas[index]["isCheck"],
                    checkChanged:(val)=> getFunction.toggle(index),
                    title: getData.datas[index]["title"],
                    onDelete:()=> getFunction.deleteData(index),
                    onEdit: ()=> getFunction.updateData(updateCtr.text, index));
              }
            ))
          ],
        ),
      ),
    );
  }
}
