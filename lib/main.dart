import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snel_app/controller/controllerMessage.dart';
import 'package:snel_app/pages/messagePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ControllerMessage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MessagePage(),
      ),
    );
  }
}


