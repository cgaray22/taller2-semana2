import 'package:flutter/material.dart';

import 'page/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion de taller 1',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}