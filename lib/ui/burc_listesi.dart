import 'package:burc_rehberi/models/burc.dart';
import 'package:burc_rehberi/utils/strings.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  static List<Burc> veriKaynaginiHazirla() {
    //Burçlarla ilgili bütün verileri aktaracağız
    List<Burc> burclar = [];
    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() +
          "${i + 1}.png"; // karmaşadan kurtulmak için hepsini küçük harf yapıp indexi ayarlayıp path oluşturacağız
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    // tek satırı düzenleyip tüm liste için dinamik şekilde bu satırdan türeteceğiz

    Burc oAnListeyeEklenenBurc = tumBurclar[index];
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
      elevation: 13,
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
          leading: Image.asset(
            "images/" + oAnListeyeEklenenBurc.burcKucukResim,
            height: 65,
            width: 65,
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              oAnListeyeEklenenBurc.burcAdi,
              style: TextStyle(
                fontSize: 23, color: Colors.purple.shade800,
                fontWeight: FontWeight.w700, // kalınlık
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              oAnListeyeEklenenBurc.burcTarihi,
              style: TextStyle(
                fontSize: 18, color: Colors.black,
                fontWeight: FontWeight.w400, // kalınlık
              ),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
