import 'package:flutter/material.dart';

import 'src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryIconTheme: IconThemeData(color: Colors.blue),
      ),
      home: HomePage(),
    );
  }
}
