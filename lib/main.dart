import 'package:flutter/material.dart';
import 'package:untitled1/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'nRetail',
      home: SafeArea(
        child: Scaffold(
          body: HomePage(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
