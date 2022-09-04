import 'package:flutter/material.dart';
import 'package:ui_design/pages/first_page.dart';
import 'package:ui_design/pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.white10,
      ),
        initialRoute: FirstPage.routeName,
      routes: {
        FirstPage.routeName : (_) => FirstPage(),
        SecondPage.routeName : (_) => SecondPage(),
      },
    );
  }
}

