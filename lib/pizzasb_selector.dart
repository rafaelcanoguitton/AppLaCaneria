import 'package:flutter/material.dart';
import 'single_multi.dart';

class PizzaBSelector extends StatefulWidget {
  final Function ag_car;
  String nom;
  int primKey;
  int secKey;
  int tirKey;
  int cuarKey;
  PizzaBSelector(this.nom, this.primKey, this.secKey, this.tirKey, this.cuarKey,
      this.ag_car) {}

  @override
  _PizzaBSelectorState createState() =>
      _PizzaBSelectorState(nom, primKey, secKey, tirKey, cuarKey, ag_car);
}

class _PizzaBSelectorState extends State<PizzaBSelector> {
  List<String> awa = [];
  final Function ag_car;
  String nom;
  int primKey;
  int secKey;
  int tirKey;
  int cuarKey;
  int mmmmkuales = -1;
  _PizzaBSelectorState(this.nom, this.primKey, this.secKey, this.tirKey,
      this.cuarKey, this.ag_car) {
    awa.add('Personal:  S/.' + primKey.toString());
    awa.add('Pequeña:   S/.' + secKey.toString());
    awa.add('Mediana    S/.' + tirKey.toString());
    awa.add('Grande     S/.' + cuarKey.toString());
  }
  void upmmk(int i) {
    print('Why yes im being ran you fucking idiot');
    mmmmkuales = i;
    print(mmmmkuales);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        child: Image(image: AssetImage('assets/pibsa2.jpg')),
        width: double.infinity,
      ),
      Padding(
        padding: const EdgeInsets.all(27.0),
        child: Text(
          widget.nom,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      Container(
        child: Expanded(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mmmmkuales = 0;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: mmmmkuales == 0 ? Colors.green[100] : null,
                      child: Row(
                        children: [
                          Text("Personal      S/." + widget.primKey.toString()),
                          Spacer(),
                          Radio(
                              value: 0,
                              groupValue: mmmmkuales,
                              activeColor: Colors.green[100]),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mmmmkuales = 1;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: mmmmkuales == 1 ? Colors.green[100] : null,
                      child: Row(
                        children: [
                          Text("Pequeña      S/." + widget.secKey.toString()),
                          Spacer(),
                          Radio(
                              value: 1,
                              groupValue: mmmmkuales,
                              activeColor: Colors.green[100]),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mmmmkuales = 2;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: mmmmkuales == 2 ? Colors.green[100] : null,
                      child: Row(
                        children: [
                          Text("Mediana      S/." + widget.tirKey.toString()),
                          Spacer(),
                          Radio(
                              value: 2,
                              groupValue: mmmmkuales,
                              activeColor: Colors.green[100]),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mmmmkuales = 3;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: mmmmkuales == 3 ? Colors.green[100] : null,
                      child: Row(
                        children: [
                          Text(
                              "Grande         S/." + widget.cuarKey.toString()),
                          Spacer(),
                          Radio(
                              value: 3,
                              groupValue: mmmmkuales,
                              activeColor: Colors.green[100]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              print('ptmre ga');
              print(mmmmkuales);
              if (mmmmkuales == 0) {
                widget.ag_car(widget.primKey.toDouble(),
                    "Pizza - Básica - " + widget.nom, widget.primKey,
                    de: "Personal");
                Navigator.of(context).pop();
              }
              if (mmmmkuales == 1) {
                widget.ag_car(widget.secKey.toDouble(),
                    "Pizza - Básica - " + widget.nom, widget.secKey,
                    de: "Pequeña");
                Navigator.of(context).pop();
              }
              if (mmmmkuales == 2) {
                widget.ag_car(widget.tirKey.toDouble(),
                    "Pizza - Básica - " + widget.nom, widget.tirKey,
                    de: "Mediana");
                Navigator.of(context).pop();
              }
              if (mmmmkuales == 3) {
                widget.ag_car(widget.cuarKey.toDouble(),
                    "Pizza - Básica - " + widget.nom, widget.cuarKey,
                    de: "Grande");
                Navigator.of(context).pop();
              }
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green.shade600),
            ),
            child: Center(child: Text('Agregar')),
          ),
        ),
      )
    ]));
  }
}
