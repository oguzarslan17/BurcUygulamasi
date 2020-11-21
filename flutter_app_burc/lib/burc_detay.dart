import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_burc/burc_liste.dart';
import 'package:palette_generator/palette_generator.dart';
import 'models/burc.dart';

class BurcDetay extends StatefulWidget {
  int detayId;

  BurcDetay(int id) {
    detayId = id;
  }

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color dominantColor;
  PaletteGenerator p;

  dominantRenkBul(){
    Future<PaletteGenerator> fp = PaletteGenerator.fromImageProvider(AssetImage("images/" + secilenBurc.burcBuyukResim));
    fp.then((value){
      p = value;
      setState(() {
        dominantColor = p.dominantColor.color;
      });
    }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.detayId];
    dominantRenkBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: false,
            backgroundColor: dominantColor != null ? dominantColor : Colors.pink,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(secilenBurc.burcAdi),
              centerTitle: true,
              background: Image.asset(
                "images/" +secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(secilenBurc.burcDetay),
            ),
          ),
        ],
      ),
    );
  }
}
