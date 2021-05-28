import 'dart:convert';
import 'package:flutter/material.dart';

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Load JSON File From Local"),),
      body: Center(
        child: FutureBuilder(builder: (context, snapshot){
          var showData=json.decode("assets/menu.json");
          print(showData["Pizzas"]);
          return ListView.builder(
            
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text('Almuerzos'),
                subtitle: Text(showData['Almuerzos']['Pasta al huevo artesanal'][index]),
              );
            },
            itemCount: 3,
          );
        }, future: DefaultAssetBundle.of(context).loadString("assets/menu.json"),
        
        ),
      ),
      
    );
  }
}