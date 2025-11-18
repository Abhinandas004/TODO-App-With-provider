import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Countercontroller extends GetxController{
  RxInt count = 0.obs
  ;
  void Increment (){
    count.value++;
  }
  void decrement() {
    if (count > 0) {
      count.value--;
    }
  }
  void reset() {
    count.value=0;
  }

}