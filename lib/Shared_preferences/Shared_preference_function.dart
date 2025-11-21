import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Countershare extends ChangeNotifier {


  void loadData()async{
    final prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }
  int counter = 0;
  void increment()async {
    counter++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter);
    notifyListeners();
  }

  void decrement()async {
    if (counter > 0) {
      counter--;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('counter', counter);
    }
    notifyListeners();
  }

  void reset() {
    counter = 0;
    notifyListeners();
  }
}
