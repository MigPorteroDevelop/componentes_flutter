//El rootbundle contiene los recursos que se empaquetaron con la app,
//contiene lo necesario para leer el archivo json.
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

//La creamos privada para crear una sola instancia en toda la app
class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargarData();
  }

  //Una función ascíncrona retorna un Future, que retorna el objeto "opciones"
  Future<List<dynamic>> cargarData() async {
    //loadString permite cargar un elemento de texto, desde la ruta especificada
    //en el archivo pubspec.yaml
    final respuesta = await rootBundle.loadString('data/menu_opt.json');

    //Utilizamos la variable "respuesta" para hacer referencia al archivo json.
    //Utilizamos la decodificacion del objeto json.
    Map dataMap = json.decode(respuesta);
    //Estas rutas son las que necesitamos almacenar en el array vacío de
    //opciones del _MenuProvider.
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();
