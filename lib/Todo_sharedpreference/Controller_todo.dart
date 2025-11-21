import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todocontroller extends ChangeNotifier {
  List<Map<String, dynamic>> Tododata = <Map<String, dynamic>>[
    {"title": "Hello", "isCheck": false},
  ];
  void loadData() async {
    final prefs = await SharedPreferences.getInstance();
    String? titles = prefs.getString('Tododata');
    if (titles != null) {
      Tododata = List<Map<String, dynamic>>.from(jsonDecode(titles));
    }
    notifyListeners();
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Tododata', jsonEncode(Tododata));
    notifyListeners();
  }

  void addNote(String title) async {
    Tododata.add({"title": title, "isCheck": false});
    final prefs = await SharedPreferences.getInstance();
    saveData();
    notifyListeners();
  }
}
