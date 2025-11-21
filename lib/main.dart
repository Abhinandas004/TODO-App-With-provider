import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Counter_controller/Counter%20ui.dart';
import 'package:state_management/Counter_provider.dart';
import 'package:state_management/Todo_sharedpreference/Controller_todo.dart';
import 'package:state_management/Todo_sharedpreference/Todo_share_ui.dart';

import 'Counter_ui.dart';
import 'Note_app/Note_app_ui.dart';
import 'Shared_preferences/Shared_counter_ui.dart';
import 'Shared_preferences/Shared_preference_function.dart';
import 'Todo/Splashscreen.dart';
import 'Todo/Todo_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Todoprovider()),
        ChangeNotifierProvider(create: (context) => Countershare()..loadData()),
        ChangeNotifierProvider(create: (context) => Todocontroller()..loadData()),
      ],
      child:
       MyApp(),
    )

  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TodoShareUi(),
    );
  }
}
