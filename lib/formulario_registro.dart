import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
class Formulario2 extends StatefulWidget {
  // static Route<dynamic> route() {
  //   return MaterialPageRoute(
  //     builder: (context) => Formulario(null),
  //   );
  //}

  @override
  FormularioState2 createState() => FormularioState2();
}

class ApiResponse {
  // _data will hold any response converted into
  // its own object. For example user.
  Object _data;
  // _apiError will hold the error object
  Object _apiError;

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ApiError => _apiError as Object;
  set ApiError(Object error) => _apiError = error;
}

class ApiError {
  String _error;

  ApiError({String error}) {
    this._error = error;
  }

  String get error => _error;
  set error(String error) => _error = error;

  ApiError.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this._error;
    return data;
  }
}

class FormularioState2 extends State<Formulario2> {
  String _baseUrl = "https://api-db--pizzeria-la-caneria.herokuapp.com/";
  String larespuestacion=null;
  Future<void> logUser(String username, String password, String wakito, String nomap,
      BuildContext context) async {
    try {
      final response = await Dio().post('${_baseUrl}registrar', data: {
        'email': username,
        'password': password,
        'num': wakito,
        'user_name': nomap,
        'credit': " "
      });
      // print('LA RECONCHA DE SU MADRE');
      // print(username);
      // print('OCTAVOPECADO');
      // print(response.data);
      // print('SU CODIGO DEL RESPONSE PE');
      // print(response.statusCode);
      if (response.statusCode == 200) {
        // showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //           title: Text('Aviso'),
        //           content: Text(response.data),
        //           actions: [
        //             TextButton(
        //                 onPressed: () {
        //                   int count = 0;
        //                   Navigator.of(context).popUntil((_) => count++ >= 2);
        //                 },
        //                 child: Text('Ok')),
        //             //TextButton(onPressed: () {}, child: Text('Cancel'))
        //           ],
        //         ));
        setState(() {
          larespuestacion=response.data;
        });
        //Navigator.of(context).pop();
      } else {
        // showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //           title: Text('Aviso'),
        //           content: Text(response.data),
        //           actions: [
        //             TextButton(
        //                 onPressed: () {
        //                   Navigator.of(context).pop();
        //                 },
        //                 child: Text('Ok')),
        //             //TextButton(onPressed: () {}, child: Text('Cancel'))
        //           ],
        //         ));
        setState(() {
          larespuestacion=response.data;
        });
      }
    } catch (e) {
      // showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //           title: Text('Aviso'),
      //           content: Text('Ocurrió un error en el servidor'),
      //           actions: [
      //             TextButton(
      //                 onPressed: () {
      //                   Navigator.of(context).pop();
      //                 },
      //                 child: Text('Ok')),
      //             //TextButton(onPressed: () {}, child: Text('Cancel'))
      //           ],
      //         ));
      setState(() {
        larespuestacion=e.response.data;
      });
    }
  }

  RegExp emailRegExp =new RegExp(r'^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$');
  RegExp contRegExp = new RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');
  String _correo;
  String _contrasena;
  String _nom;
  String _ape;
  String _wakito;
  bool loggiloggi = false;
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/fondito.jpg"),
      fit: BoxFit.cover,
    ),
  ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          // backgroundColor: Colors.orange,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    //width: double.infinity,
                    height: 200,
                    //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Image(
                      image: AssetImage('assets/imagen.png'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //margin: EdgeInsets.symmetric(vertical: 220),
                    //padding: EdgeInsets.symmetric(vertical: 40),
                    child: Column(children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 50.0),
                          child: Form(
                              key: _key,
                              child: Column(
                                children: <Widget>[
                                  Text('Registro'),
                                  SizedBox(height: 25),
                                  TextFormField(
                                    validator: (text) {
                                      if (text.length == 0) {
                                        return "Este campo correo es requerido";
                                      } else if (!EmailValidator.validate(text)) {
                                        return "El formato para correo no es correcto";
                                      }
                                      return null;
                                    },
                                    maxLength: 50,
                                    decoration: InputDecoration(errorMaxLines: 2,
                                        counterText: '',
                                        border: OutlineInputBorder(),
                                        hintText: 'Correo electrónico'),
                                    onSaved: (text) => _correo = text,
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    validator: (text) {
                                      if (text.length == 0) {
                                        return "Este campo contraseña es requerido";
                                      } else if (text.length <= 5) {
                                        return "Su contraseña debe ser al menos de 5 caracteres";
                                      } else if (!contRegExp.hasMatch(text)) {
                                        return "El formato para contraseña no es correcto";
                                      }
                                      return null;
                                    },
                                    maxLength: 50,
                                    decoration: InputDecoration(errorMaxLines: 2,
                                        counterText: '',
                                        border: OutlineInputBorder(),
                                        hintText: 'Contraseña'),
                                    onSaved: (text) => _contrasena = text,
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    validator: (text) {
                                      if (text.length == 0) {
                                        return "Este campo número es requerido";
                                      } else if (text.length <= 8) {
                                        return "Su número debe ser de al menos de 9 caracteres";
                                      }
                                      return null;
                                    },
                                    maxLength: 50,
                                    decoration: InputDecoration(errorMaxLines: 2,
                                        counterText: '',
                                        border: OutlineInputBorder(),
                                        hintText: 'Número de telefono'),
                                    onSaved: (text) => _wakito = text,
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    validator: (text) {
                                      if (text.length == 0) {
                                        return "Nombre requerido";
                                      }
                                      return null;
                                    },
                                    maxLength: 50,
                                    decoration: InputDecoration(errorMaxLines: 2,
                                        counterText: '',
                                        border: OutlineInputBorder(),
                                        hintText: 'Nombres'),
                                    onSaved: (text) => _nom = text,
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    validator: (text) {
                                      if (text.length == 0) {
                                        return "Apellido requerido";
                                      }
                                      return null;
                                    },
                                    maxLength: 50,
                                    decoration: InputDecoration(errorMaxLines: 2,
                                        counterText: '',
                                        border: OutlineInputBorder(),
                                        hintText: 'Apellidos'),
                                    onSaved: (text) => _ape = text,
                                  ),
                                  ElevatedButton(
                                    child: Text('Registrarse'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange.shade300),
                                    onPressed: () {
                                      if (_key.currentState.validate()) {
                                        _key.currentState.save();
                                        //AQUI VAMOS A LLAMAR LA API GAAAA
                                        setState(() {
                                          showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text('Aviso'),
                                                content: FutureBuilder(
                                                    future: logUser(_correo, _contrasena, _wakito,
                                              _nom + _ape, context),
                                                    builder:
                                                        ( context,
                                                                snapshot) {
                                                      if (larespuestacion==null) {
                                                        return Container(
                                                            height: 40,
                                                            child:Center(child:
                                                                CircularProgressIndicator())
                                                            );
                                                      } else {
                                                        return Text(
                                                            larespuestacion);
                                                      }
                                                      larespuestacion=null;
                                                    }),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        larespuestacion=null;
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Ok')),
                                                  //TextButton(onPressed: () {}, child: Text('Cancel'))
                                                ],
                                              ));
                                        });
                                        print(
                                            'Gracias \n $_correo \n $_contrasena');
//                      Una forma correcta de llamar a otra pantalla
//                      Navigator.of(context).push(HomeScreen.route(mensaje));
                                      }
                                    },
                                  ),
                                ],
                              )))
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
