import 'package:flutter/material.dart';
import 'package:flutter_app_burc/models/burc.dart';
import 'package:flutter_app_burc/utils/strings.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    tumBurclar = BurclariGetir();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Burç Listesi"),
        ),
        body: ListeyiHazirla());
  }

  List<Burc> BurclariGetir() {
    List<Burc> tumB = new List<Burc>();
    for (int i = 0; i < Strings.BURC_ADLARI.length; i++) {
      Burc b = new Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          Strings.BURC_ADLARI[i].toLowerCase() + (i + 1).toString() + ".png",
          Strings.BURC_ADLARI[i].toLowerCase() +
              "_buyuk" +
              (i + 1).toString() +
              ".png");
      tumB.add(b);
    }
    return tumB;
  }

  Widget ListeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return BurcWidget(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget BurcWidget(BuildContext ctx, int i) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: (){
            Navigator.pushNamed(ctx, "/burcDetay/$i");
          },
          leading: Image.asset(
            "images/" + tumBurclar[i].burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            tumBurclar[i].burcAdi,
            style: TextStyle(fontSize: 24, color: Colors.pink),
          ),
          subtitle: Text(tumBurclar[i].burcTarihi,
              style: TextStyle(fontSize: 18, color: Colors.black38)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
