import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Shared_preference_function.dart';

class SharedCounterUi extends StatelessWidget {
  const SharedCounterUi({super.key});

  @override
  Widget build(BuildContext context) {
   final getcounter = Provider.of<Countershare>(context);
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(getcounter.counter.toString(), style: TextStyle(fontSize: 60))),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              getcounter.decrement();
            }, icon: Icon(Icons.minimize_outlined,size: 40,)),
            SizedBox(width: 30,),
            IconButton(onPressed: () {
              getcounter.increment();
            }, icon: Icon(Icons.add,size: 40,)),
            SizedBox(width: 30,),
            IconButton(onPressed: () {
              getcounter.reset();
            }, icon: Icon(Icons.restart_alt,size: 40,)),
          ],
        ),
      ],
    ),
    );
  }
}
