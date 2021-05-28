import 'package:flutter/material.dart';
import 'triplewea.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class CarritoCompras extends StatefulWidget {
  List<TripleWea> itemsitos;
  final Function handlersito;
  CarritoCompras(this.itemsitos, this.handlersito);
  @override
  CarritoComprasState createState() =>
      CarritoComprasState(itemsitos, handlersito);
}

class CarritoComprasState extends State<CarritoCompras> {
  void delete_handler(int i) {
    setState(() {
      itemsitos.removeAt(i);
      print('Miotrohandlerrecibesto ' + i.toString());
      otro_handler(itemsitos);
    });
  }

  String _baseUrl = "https://api-db--pizzeria-la-caneria.herokuapp.com/";
  void ordenar_api_handler() async {
    List<Item> ask = [];
    for (var i = 0; i < itemsitos.length; i++) {
      ask.add(Item(
          nombre: itemsitos[i].nombre,
          precio: itemsitos[i].precio,
          tamao: itemsitos[i].desc));
    }
    var itemes = Menu(
      medioDePago: "efectivo",
      ubicacion: "prueba",
      comentario: " ",
      items: ask,
    );
    try {
      var teste = menuToJson(itemes);
      var appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      var dio = Dio();
      dio.interceptors.add(CookieManager(PersistCookieJar(
          ignoreExpires: true,
          storage: FileStorage(appDocPath + "/.cookies/"))));
      final response = await dio.post('${_baseUrl}hacer_pedido', data: teste);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Aviso'),
                content: Text(response.data),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok')),
                  //TextButton(onPressed: () {}, child: Text('Cancel'))
                ],
              ));
      List<TripleWea> replace = [];
      itemsitos = replace;
      otro_handler(itemsitos);
    } catch (e) {
      if (e.type == DioErrorType.other)
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Aviso'),
                  content: Text('Ocurrió un error en el servidor'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Ok')),
                    //TextButton(onPressed: () {}, child: Text('Cancel'))
                  ],
                ));
      else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Aviso'),
                  content: Text(e.response.data),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Ok')),
                    //TextButton(onPressed: () {}, child: Text('Cancel'))
                  ],
                ));
      }
    }
    //print(teste);
    // print("response.body");
    // print(response.data);
    // print("response.statusCode");
    // print(response.statusCode);
  }

  List<TripleWea> itemsitos;
  final Function otro_handler;
  CarritoComprasState(this.itemsitos, this.otro_handler);
  List<Widget> construc() {
    List<Widget> a = [];
    a.add(
      Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_outlined,),
            ),
            Expanded(
              child: Text(
                "Tu pedido",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
            ),
            Container(child: Text("           "),),
          ],
        ),
      ),
    );
    for (var i = 0; i < itemsitos.length; i++) {
      a.add(Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.black54),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: 150,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/fondito.jpg"),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  itemsitos[i].nombre,maxLines: 2,
                  
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'S/.' + itemsitos[i].precio.toString(),
                ),
                Text(itemsitos[i].desc),
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    size: 20.0,
                    color: Colors.red[900],
                  ),
                  onPressed: () {
                    delete_handler(i);
                  },
                )
              ],
            ),
          ],
        ),
      ));
    }
    return a;
  }

// Text(itemsitos[i].nombre),
//           Text('S/.' + itemsitos[i].precio.toString()),
//           Text(itemsitos[i].desc),
  @override
  Widget build(BuildContext context) {
    List<Widget> compras = construc();
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: compras,
          ),
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Ordenar'),
                  onPressed: () {
                    ordenar_api_handler();
                  },
                ),
              ],
            ))
      ],
    ));
  }
}
