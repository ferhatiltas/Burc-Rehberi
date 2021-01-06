import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as matematik;

class BurcRehberiDemo extends StatelessWidget {
  // Liste için veri kaynağı :
  List<int> listeNumaralari = List.generate(12, (index) => index);
  List<String> listeBaslik = List.generate(12, (index) => "Burç Adı : $index");
  List<String> listeAltBaslik = List.generate(12, (index) => "Burç Tarihi : $index");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Burç Rehberi"),
      ),
      body: ListView(
        // .map metodu ile listeyi widgete dönüştürüp sonrasında toList ile tekrardan listeye dönüştüreceğiz
        children: listeNumaralari
            .map(
              (oAnkiEleman) => Column(
                children: <Widget>[
                  Container(
// Center dersek başlar başlamaz öğeler uygulamanın tam ortasından başlayacak
// Container ise en baştan başlatacak nesneleri
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.only(
                          left: 17, bottom: 5, right: 17, top: 20),
                      elevation: 15,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.account_circle),
                          radius: 23,
                        ),
                        title: Text(
                          listeBaslik[oAnkiEleman],
                          style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          listeAltBaslik[oAnkiEleman],
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BurcDetay()));
                        },

                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class BurcDetay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Silver App Bar"),
          backgroundColor: Colors.purple,
          expandedHeight: 300,
          floating: false,
          // Bu özellik Silver appın altındaki liste
          // aşağıdan yukarıyo doğru çekildiğinde AppBar hemen ortaya çıkar false olursa daha güzel olur
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(sabitListeElemanlari()),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _dinamikElemanUretenFonksiyon,
            childCount:
            6, //dinamik olarak 6 tane _dinamikElemanUretenFonksiyon oluşacak
          ),
        )
      ],
    );

  }
  Widget _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      alignment: Alignment.center,
      height: 120,
      color: rastgeleRenkUret(),
      child: Text("Dinamik Liste Elemanı ${index + 1}",
          style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
    );
  }

  Color rastgeleRenkUret() {
    // 0 ile 255 arasında rastgele sayı üretecek ürettiği bu sayıları fromARGB metodu aracılığı ile renk değerlerine atayacak
    return Color.fromARGB(
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255));
  }

  List<Widget> sabitListeElemanlari() {
    return [
      Container(
        alignment: Alignment.center,
        height: 120,
        color: Colors.cyanAccent,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 120,
        color: Colors.lightGreenAccent,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 120,
        color: Colors.yellow,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 120,
        color: Colors.red,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 120,
        color: Colors.green,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 120,
        color: Colors.blue,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }
}
/*
*  Card(
        margin: EdgeInsets.all(12),
        elevation: 15,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              height: 90,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 33,
                  ),
                  Column(
                    children: [Text("                     ")],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Burç Adı",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        "Burç Tarihi",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),*/
