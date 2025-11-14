import 'package:flutter/material.dart';

class Todoprovider extends ChangeNotifier {

  List<Map<String,dynamic>> datas = [
    {
      "title":"helllo",
      "isCheck":false,
      "time":TimeOfDay.now()
    }
  ];

  void addData(String title){
    datas.add({
      "title":title,
      "isCheck":false,
      "time":TimeOfDay.now()
    });
    notifyListeners();
  }

  void updateData(String newTitle,int index){
    datas[index]["title"] = newTitle;
    notifyListeners();
  }

  void deleteData(int index){
    datas.removeAt(index);
    notifyListeners();
  }

  void toggle(int index){
    datas[index]["isCheck"] = !datas[index]["isCheck"];
    notifyListeners();
  }


  }



