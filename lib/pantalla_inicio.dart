import 'package:app/my_iconsitos_icons.dart';
import 'package:flutter/material.dart';
import 'menusito.dart';
import 'triplewea.dart';
import 'carrito.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'pantalla_gmaps.dart';

class MenuPrincipal extends StatefulWidget {
  final Function tas_loggeado;
  MenuPrincipal(this.tas_loggeado);
  @override
  MenuPrincipalState createState() => MenuPrincipalState(tas_loggeado);
}

class MenuPrincipalState extends State<MenuPrincipal> {
  bool c1 = true;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;
  int acc_pan = 1;
  void change_color(int x) {
    switch (x) {
      case 1:
        {
          setState(() {
            c1 = true;
            c2 = false;
            c3 = false;
            c4 = false;
            acc_pan = 1;
          });
        }
        break;
      case 2:
        {
          setState(() {
            c1 = false;
            c2 = true;
            c3 = false;
            c4 = false;
            acc_pan = 2;
          });
        }
        break;
      case 3:
        {
          setState(() {
            c1 = false;
            c2 = false;
            c3 = true;
            c4 = false;
            acc_pan = 3;
          });
        }
        break;
      case 4:
        {
          setState(() {
            c1 = false;
            c2 = false;
            c3 = false;
            c4 = true;
            acc_pan = 4;
          });
        }
    }
  }
  DecorationImage image1;
  DecorationImage image2;
  DecorationImage image3;
  
  
  
  
  @override
  void initState() {


    image1 = DecorationImage(
                            image: AssetImage('assets/pibsa2.jpg'),
                            fit: BoxFit.cover,
                          );
    image2 = DecorationImage(
                            image: AssetImage('assets/fondito.jpg'),
                            fit: BoxFit.cover,
                          );
    image3 = DecorationImage(
                            image: AssetImage('assets/pizza1.jpg'),
                            fit: BoxFit.cover,
                          );
    
    super.initState();
  }

  @override
  void didChangeDependencies() async{
    precacheImage(AssetImage("assets/pibsa2.jpg"), context);
    precacheImage(AssetImage("assets/fondito.jpg"), context);
    precacheImage(AssetImage("assets/pizza1.jpg"), context);
    super.didChangeDependencies();
  }
  Widget showCual(int show) {
    if (show == 1) {
      return Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Básica',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                          fontSize: 20),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Menusito((upCarrito))),
                    );
                      },
                      child: Container(
                        width: 160,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: image1,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mixtas',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                          fontSize: 20),
                    ),
                    InkWell(
                      onTap: (){
                        print('Spoken Promises');
                      },
                      child: Container(
                        width: 160,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: image2,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dulce',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                          fontSize: 20),
                    ),
                    InkWell(
                      onTap: (){
                        print('Spoken Promises');
                      },
                      child: Container(
                        width: 160,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: image3,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calzones',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                          fontSize: 20),
                    ),
                    InkWell(
                      onTap: (){
                        print('Spoken Promises');
                      },
                      child: Container(
                        width: 160,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: image1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    } else if (show == 2) {
      return Text('//TODO');
    } else if (show == 3) {
      return Text('//TODO');
    } else if (show == 4) {
      return Text('//TODO');
    }
  }

  void deletio_handler(List<TripleWea> itemx) {
    setState(() {
      items = itemx;
      precio = 0;
      itemcount = itemx.length;
      for (var i = 0; i < itemx.length; i++) {
        precio += itemx[i].precio;
      }
    });
  }

  void cambiarPosi(double x, double y) async {
    print('Esta es la pos que se recibe');
    print(x);
    print(y);
    posicion = Position(latitude: x, longitude: y);
    List placemarks = await placemarkFromCoordinates(x, y);
    var place = placemarks[0];
    print('POR LA PUTAMARE GAAA');
    print(place.locality);
    setState(() {
      String name = place.name;
      String subLocality = place.subLocality;
      String locality = place.locality;
      String administrativeArea = place.administrativeArea;
      // String postalCode = place.postalCode;
      // String country = place.country;
      String street = place.street;
      String address =
          "${street}, ${subLocality}, ${locality}, ${administrativeArea} ";
      pleisjolder = address;
      print(address);
    });
  }

  final Function funci;
  int itemcount = 0;
  double precio = 0.0;
  Position posicion;
  bool plswork = true;
  var pleisjolder = "Localizando...";
  List<TripleWea> items = [];
  void upCarrito(double p, String nom, int prec, {String de = null}) {
    setState(() {
      itemcount++;
      precio += p;
      var wea = TripleWea(nom, prec, de);
      items.add(wea);
    });
  }

  MenuPrincipalState(this.funci);
  void getCurrentocation() async {
    var posi = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    List placemarks =
        await placemarkFromCoordinates(posi.latitude, posi.longitude);
    var place = placemarks[0];
    setState(() {
      posicion = posi;
      String name = place.name;
      String subLocality = place.subLocality;
      String locality = place.locality;
      String administrativeArea = place.administrativeArea;
      // String postalCode = place.postalCode;
      // String country = place.country;
      String street = place.street;
      String address =
          "${street}, ${subLocality}, ${locality}, ${administrativeArea} ";
      pleisjolder = address;
      print(address);
    });
  }

  @override
  Widget build(BuildContext context) {
    //precacheImage(AssetImage("assets/pibsa2.jpg"), context);
    //precacheImage(AssetImage("assets/fondito.jpg"), context);
    //precacheImage(AssetImage("assets/pizza1.jpg"), context);
    //precacheImage(AssetImage("assets/pibsa2.jpg"), context);
    if (plswork) {
      getCurrentocation();
      plswork = false;
    }
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue.shade900),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            side: BorderSide(color: Colors.black))),
                  ),
                  child: Text(pleisjolder),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapSample(cambiarPosi,
                                posicion.latitude, posicion.longitude)));
                  },
                ),
              ),
            ),
            Container(
              //width: double.infinity,
              height: 160,
              //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image(
                image: AssetImage('assets/imagen2.jpg'),
                // image: AssetImage('assets/imagen.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      c1 ? Colors.orange : Colors.white,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            side: BorderSide(color: Colors.black))),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 35,
                        height: 35,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Image(
                            image: AssetImage('assets/pizza.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                      Container(
                        child: Text('Pizzas'),
                      ),
                    ],
                  ),
                  onPressed: () {
                    change_color(1);
                    
                  },
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(20)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          c2 ? Colors.orange : Colors.white,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                    side: BorderSide(color: Colors.black))),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 35,
                            height: 35,
                            child: Container(
                              width: 24,
                              height: 24,
                              child: Image(
                                image: AssetImage('assets/pasta.png'),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          Text('Pasta'),
                        ],
                      ),
                      onPressed: () {
                        change_color(2);
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      c3 ? Colors.orange : Colors.white,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            side: BorderSide(color: Colors.black))),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 35,
                        height: 35,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Image(
                            image: AssetImage('assets/spaguetti.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                      Text('Platos'),
                    ],
                  ),
                  onPressed: () {
                    change_color(3);
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 20,horizontal: 15)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      c4 ? Colors.orange : Colors.white,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            side: BorderSide(color: Colors.black))),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 35,
                        height: 35,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Image(
                            image: AssetImage('assets/softdrinks.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                      Text('Bebidas'),
                    ],
                  ),
                  onPressed: () {
                    change_color(4);
                  },
                ),
              ],
            ),
            showCual(acc_pan),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(vertical: 17)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green.shade600),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(18.0)),
                                    side: BorderSide(color: Colors.black38)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.shade900,
                                border: Border.all(
                                  color: Colors.blue.shade900,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            //color: Colors.blue.shade900,
                            padding: EdgeInsets.all(10),
                            child: Text(itemcount.toString())),
                        Text('Ver Canasta'),
                        Text("S/." + precio.toString())
                      ],
                    ),
                    onPressed: () {
                      if (!items.isEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CarritoCompras(items, deletio_handler)),
                        );
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
