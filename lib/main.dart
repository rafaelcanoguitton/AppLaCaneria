import 'package:flutter/material.dart';
import 'formulario.dart';
import 'package:flutter/services.dart';
import 'pantalla_inicio.dart';

//import 'splashscreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void setestau() {
    setState(() {
      logged_in = false;
      if (logged_in) {
        MenuPrincipal(setestau);
      } else {}
      print('llamada a la loggeada');
    });
  }

  void setestau2() {
    setState(() {
      logged_in = true;
      if (logged_in) {
        MenuPrincipal(setestau);
      } else {}
      print('llamada a la loggeada');
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  bool logged_in = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: logged_in ? MenuPrincipal(setestau) : Formulario(setestau2),
    );
  }
}
