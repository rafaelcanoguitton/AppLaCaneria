import 'dart:convert';
class TripleWea{
  final String nombre;
  final int precio;
  final String desc;
  TripleWea(this.nombre,this.precio,this.desc);
  TripleWea.fromJson(Map<String, dynamic> json)
      :  nombre= json['nombre'],
        precio = json['precio'],
        desc=json['tamaño'];
  Map<String,dynamic>toJson()=>{
    'nombre':nombre,
    'precio':precio,
    'tamaño':desc== null ? null : desc,
  };

}
// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
    Menu({
        this.medioDePago,
        this.ubicacion,
        this.comentario,
        this.items,
    });

    String medioDePago;
    String ubicacion;
    String comentario;
    List<Item> items;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        medioDePago: json["medio_de_pago"],
        ubicacion: json["ubicacion"],
        comentario: json["comentario"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "medio_de_pago": medioDePago,
        "ubicacion": ubicacion,
        "comentario": comentario,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.nombre,
        this.precio,
        this.tamao,
    });

    String nombre;
    int precio;
    String tamao;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        nombre: json["nombre"],
        precio: json["precio"],
        tamao: json["tamaño"] == null ? null : json["tamaño"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "precio": precio,
        "tamaño": tamao == null ? null : tamao,
    };
}
