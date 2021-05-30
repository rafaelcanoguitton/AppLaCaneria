import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'pizzasb_selector.dart';

class Menusito3 extends StatelessWidget {
  //final data=json.decode('assets/menu.json');
  // Fetch content from the json file
  List<Widget> Menu = [];
  final Function ag_carrito;
  Menusito3(this.ag_carrito);
  Map<String, List<String>> pizzasB;
  Future<void> readJson(BuildContext context) async {
    final String response = await rootBundle.loadString('assets/menu.json');
    //final menu = menuFromJson(response);
    //print(menu.almuerzos.pastaAlHuevoArtesanal[0]);
    var menu = json.decode(response);
    print('MIERDAAA');
    menu["Pizzas"]["Dulce-Sweet"].forEach((key, value) {
      String nomPizza = key;
      int primKey = value["PERSONAL"];
      int secKey = value["PEQUEÑA"];
      int tirKey = value["MEDIANA"];
      int cuarKey = value["GRANDE"];
      // print(nomPizza);
      // print('GETASDAS');
      // print(value["PERSONAL"]);
      // List<String> temps=[];
      // temps.add(primKey.toString());
      // temps.add(secKey.toString());
      // temps.add(tirKey.toString());
      // temps.add(cuarKey.toString());
      // Menu.add(ListTile(
      //   onTap: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => PizzaBSelector(nomPizza,primKey,secKey,tirKey,cuarKey,ag_carrito)));
      //             },
      //   title: Text(nomPizza),
      //   subtitle:
      //       Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      //     Column(
      //         children: [Text('Personal'), Text('S/.' + primKey.toString())],
      //       ),
      //     Column(
      //         children: [Text('Pequeña'), Text('S/.' + secKey.toString())],
      //       ),
      //     Column(
      //         children: [Text('Mediana'), Text('S/.' + tirKey.toString())],
      //       ),
      //     Column(
      //         children: [Text('Grande'), Text('S/.' + cuarKey.toString())],
      //       ),
      //   ]),
      // ));
      Menu.add(InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PizzaBSelector(
                      nomPizza, primKey, secKey, tirKey, cuarKey, ag_carrito)));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(children: [
            Text(
              nomPizza,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  Text('Personal', style: TextStyle(color: Colors.black54)),
                  Text('S/.' + primKey.toString(),
                      style: TextStyle(color: Colors.black54))
                ],
              ),
              Column(
                children: [
                  Text('Pequeña', style: TextStyle(color: Colors.black54)),
                  Text('S/.' + secKey.toString(),
                      style: TextStyle(color: Colors.black54))
                ],
              ),
              Column(
                children: [
                  Text('Mediana', style: TextStyle(color: Colors.black54)),
                  Text('S/.' + tirKey.toString(),
                      style: TextStyle(color: Colors.black54))
                ],
              ),
              Column(
                children: [
                  Text('Grande', style: TextStyle(color: Colors.black54)),
                  Text('S/.' + cuarKey.toString(),
                      style: TextStyle(color: Colors.black54))
                ],
              ),
            ]),
          ]),
        ),
      ));
      Menu.add(
        SizedBox(height: 10),
      );
      print(Menu.length);
    });

    print(Menu.runtimeType);
    // menu["Pizzas"]["Básica"].forEach((key, value) {
    //   print(key);
    //   Menu.add(ListTile(
    //     title: Text(key),

    //     subtitle: Row(
    //       children: [
    //         ElevatedButton(
    //           key: value["PERSONAL"],
    //           child: Text('S/.'+value["PERSONAL"].toString()),
    //         ),
    //         ElevatedButton(
    //           key: value["PERSONAL"],
    //           child: Text('S/.'+value["PEQUEÑA"].toString()),
    //         ),
    //         ElevatedButton(
    //           key: value["PERSONAL"],
    //           child: Text('S/.'+value["MEDIANA"].toString()),
    //         ),
    //         ElevatedButton(
    //           key: value["PERSONAL"],
    //           child: Text('S/.'+value["GRANDE"].toString()),
    //         ),
    //       ],
    //     ),
    //   ));
    // });
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: FutureBuilder(
            future: readJson(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView(
                  children: Menu,
                );
              }
            }),
      ),
    );
  }
}
