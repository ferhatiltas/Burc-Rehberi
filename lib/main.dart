import 'package:burc_rehberi/ui/burc_listesi.dart';
import 'package:flutter/material.dart';

import 'ui/burc_detay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
       // "/": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari=settings.name.split("/");
        if(pathElemanlari[1]=='burcDetay'){
          return MaterialPageRoute(builder: (context)=>BurcDetay((int.parse(pathElemanlari[2]))));
        }
        return null;
      },
      theme: ThemeData(primarySwatch: Colors.purple),
      title: "Burç Rehperi",
      home: BurcListesi(),
    );
  }
}
