import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';

class Menusito extends StatelessWidget {
  //final data=json.decode('assets/menu.json');
  // Fetch content from the json file
  List<Widget> Menu = [];
  final Function ag_carrito;
  Menusito(this.ag_carrito);
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/menu.json');
    //final menu = menuFromJson(response);
    //print(menu.almuerzos.pastaAlHuevoArtesanal[0]);
    var menu = json.decode(response);
    print('MIERDAAA');
    menu["BEBIDAS"].forEach((key, value) {
      String nomPizza = key;
      int primKey = value["PERSONAL"];
      int secKey = value["PEQUEÑA"];
      int tirKey = value["MEDIANA"];
      int cuarKey = value["GRANDE"];
      // print(nomPizza);
      // print('GETASDAS');
      // print(value["PERSONAL"]);/*/**/ */
      Menu.add(ListTile(
        title: Text(nomPizza),
        subtitle:
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(
            onPressed: (){ag_carrito(primKey.toDouble(),nomPizza,cuarKey,de:'Personal');},
            child: Column(children: [Text('Personal'),Text('S/.' + primKey.toString())],),
          ),
          ElevatedButton(
            onPressed: (){ag_carrito(cuarKey.toDouble(),nomPizza,cuarKey,de:'Pequeña');},
            child: Column(children: [Text('Pequeña'),Text('S/.' + secKey.toString())],),
          ),
          ElevatedButton(
            onPressed: (){ag_carrito(tirKey.toDouble(),nomPizza,cuarKey,de:'Mediana');},
            child: Column(children: [Text('Mediana'),Text('S/.' + tirKey.toString())],),
          ),
          ElevatedButton(
            onPressed: (){ag_carrito(cuarKey.toDouble(),nomPizza,cuarKey,de:'Grande');},
            child: Column(children: [Text('Grande'),Text('S/.' + cuarKey.toString())],),
          ),
        ]),
      ));
      print(Menu.length);
    });
    print(Menu.runtimeType);
  }

  String a;
  String b;
  List x;
  @override
  Widget build(BuildContext context) {
    print('hojdasler');
    print(Menu.length);
    //menu["Pizzas"]["Básica"]
    return Scaffold(
      body: FutureBuilder(
          future: readJson(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView(children: Menu);
            }
          }),
    );
  }
}
