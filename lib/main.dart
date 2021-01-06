import 'package:burc_rehberi/ui/burc_rehberi_demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Burç Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: BurcRehberiDemo(),
    ),
  );
}
