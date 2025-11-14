import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Counter_provider.dart';

class CounterUi extends StatelessWidget {
  const CounterUi({super.key});

  @override
  Widget build(BuildContext context) {
    final Countervalue = Provider.of<Counterprovider>(context).count;
    final Click = Provider.of<Counterprovider>(context,listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(Countervalue.toString(), style: TextStyle(fontSize: 60))),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {
                Click.decrement();

              }, icon: Icon(Icons.minimize_outlined,size: 40,)),
              SizedBox(width: 30,),
    IconButton(onPressed: () {
      Click.increment();

    }, icon: Icon(Icons.add,size: 40,)),
              SizedBox(width: 30,),
    IconButton(onPressed: () {
      Click.reset();

    }, icon: Icon(Icons.restart_alt,size: 40,)),
            ],
          ),


        ],
      ),

    );
  }
}
