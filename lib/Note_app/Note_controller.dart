import 'package:get/get.dart';

class NoteController extends GetxController {
  RxList<Map<String, dynamic>> notes = <Map<String, dynamic>>[
    {"title": "Hello"},
  ].obs;

  void addNote(String title) {
    notes.add({"title": title});
  }
}
