import 'package:burc_rehberi/models/burc.dart';
import 'package:burc_rehberi/ui/burc_listesi.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  BurcDetayState createState() {
    return new BurcDetayState();
  }
}

class BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
    PaletteGenerator.fromImageProvider(
        AssetImage("images/" + secilenBurc.burcBuyukResim));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator.dominantColor.color.toString());

      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SingleChildScrollView(
                child: Text(secilenBurc.burcDetay,
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}