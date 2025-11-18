import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:state_management/Counter_controller/Countercontroller.dart';

class GetXCounterui extends StatelessWidget {
  const GetXCounterui({super.key});

  @override
  Widget build(BuildContext context) {
    final getcontroller = Get.put(Countercontroller());
    return Scaffold(body: Obx(
       () {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(getcontroller.count.toString(), style: TextStyle(fontSize: 60))),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {
                  getcontroller.decrement();
                }, icon: Icon(Icons.minimize_outlined,size: 40,)),
                SizedBox(width: 30,),
                IconButton(onPressed: () {
                  getcontroller.Increment();
                }, icon: Icon(Icons.add,size: 40,)),
                SizedBox(width: 30,),
                IconButton(onPressed: () {
                  getcontroller.reset();
                }, icon: Icon(Icons.restart_alt,size: 40,)),
              ],
            ),
          ],
        );
      }
    ),
    );
  }
}
