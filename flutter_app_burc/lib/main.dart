import 'package:flutter/material.dart';
import 'package:flutter_app_burc/test.dart';
import 'burc_detay.dart';
import 'burc_liste.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Burç Rehberi",
      initialRoute: "/burcListesi",
      onGenerateRoute: (RouteSettings setting){
        List<String> path = setting.name.split("/");
        if(path[1] == "burcDetay"){
          return MaterialPageRoute(builder :(context) => BurcDetay(int.parse(path[2])));
        }else{
          return MaterialPageRoute(builder :(context) => BurcListesi());
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      debugShowCheckedModeBanner: false,
      home: BurcListesi(),
    );
  }
}