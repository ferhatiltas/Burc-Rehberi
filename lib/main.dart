import 'package:burc_rehberi/ui/burc_listesi.dart';
import 'package:burc_rehberi/ui/burc_rehberi_demo.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple
      ),
      title: "Burç Rehperi",
      home: BurcListesi(),

    );
  }
}
