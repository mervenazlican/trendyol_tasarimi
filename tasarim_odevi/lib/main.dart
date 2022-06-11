import 'package:flutter/material.dart';
import 'package:tasarim_odevi/anasayfa.dart';
import 'package:tasarim_odevi/yemekler.dart';
import 'package:tasarim_odevi/yemekler_sayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const YemeklerSayfa(),
    );
  }
}
