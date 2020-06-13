import 'package:flutter/material.dart';
import './passwordGen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 10,
              title: Text("Password Generator"),
            ),
            body: PasswprdGenerator()),
      ),
    );
  }
}
