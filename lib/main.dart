import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_web/custom_paint/signature_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Store',
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: SignaturePage(),
    );
  }
}
