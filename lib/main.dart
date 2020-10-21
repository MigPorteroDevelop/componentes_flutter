import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:componentes_flutter/src/pages/avatar_page.dart';
import 'package:componentes_flutter/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      //Definimos las rutas
      routes: <String, WidgetBuilder>{
        //Definimos un mapa que cumpla la condición
        '/': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
      },
    );
  }
}
