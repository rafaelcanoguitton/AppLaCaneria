import 'dart:io';

import 'package:app/maijson.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'formulario_registro.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class Formulario extends StatefulWidget {
  final Function funci;
  Formulario(this.funci);
  // static Route<dynamic> route() {
  //   return MaterialPageRoute(
  //     builder: (context) => Formulario(null),
  //   );
  //}

  @override
  FormularioState createState() => FormularioState(funci);
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

class FormularioState extends State<Formulario> {
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage("assets/fondito.jpg"), context);
    super.didChangeDependencies();
  }
  final Function func;
  FormularioState(this.func);
  String _baseUrl = "https://api-db--pizzeria-la-caneria.herokuapp.com/";

  void logUser(String username, String password, BuildContext context) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      print(appDocPath);
      var dio = Dio();
      dio.interceptors.add(CookieManager(PersistCookieJar(
          ignoreExpires: true,
          storage: FileStorage(appDocPath + "/.cookies/"))));
      final response = await dio.post('${_baseUrl}login', data: {
        'email': username,
        'password': password,
      });
      print('OCTAVOPECADO');
      print(response.data);
      print('SU CODIGO DEL RESPONSE PE');
      print(response.statusCode);
      if (response.statusCode == 200) {
        func();
      }
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
  }

  RegExp emailRegExp =
      new RegExp(r'^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$');
  RegExp contRegExp = new RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');
  String _correo;
  String _contrasena;
  GlobalKey<FormState> _key = GlobalKey();
  bool _logueado = false;
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        //backgroundColor: Colors.orange,
        body: Container(
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
                          horizontal: 70.0, vertical: 67.0),
                      child: Form(
                          key: _key,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (text) {
                                  if (text.length == 0) {
                                    return "Este campo correo es requerido";
                                  } else if (!emailRegExp.hasMatch(text)) {
                                    return "El formato para correo no es correcto";
                                  }
                                  return null;
                                },
                                maxLength: 50,
                                decoration: InputDecoration(
                                    errorMaxLines: 2,
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                    hintText: 'Correo electrónico'),
                                onSaved: (text) => _correo = text,
                              ),
                              SizedBox(height: 10),
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
                                decoration: InputDecoration(
                                    errorMaxLines: 2,
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                    hintText: 'Contraseña'),
                                onSaved: (text) => _contrasena = text,
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                child: Text('Iniciar sesión'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orange.shade300),
                                onPressed: () {
                                  if (_key.currentState.validate()) {
                                    _key.currentState.save();
                                    //AQUI VAMOS A LLAMAR LA API GAAAA
                                    setState(() {
                                      logUser(_correo, _contrasena, context);
                                    });
                                    print(
                                        'Gracias \n $_correo \n $_contrasena');
//                      Una forma correcta de llamar a otra pantalla
//                      Navigator.of(context).push(HomeScreen.route(mensaje));
                                  }
                                },
                              ),
                              SizedBox(height: 7),
                              TextButton(
                                  onPressed: () => print('Pues que huevón'),
                                  child: Text('¿Olvidaste tu contraseña?')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Formulario2()),
                                    );
                                  },
                                  child: Text('¿Aún no estás registrado?')),
                            ],
                          )))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
