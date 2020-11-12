import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  //Creamos una propiedad estática para la ruta.
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://4.bp.blogspot.com/-ne9lut0D37g/WPYkvhJhGUI/AAAAAAAAAuM/5rCQjA4LEUALqzmyvvp49egossWJYIukQCLcB/s1600/yo.png'),
              radius: 19.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              child: Text('MP'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://www.formulamoto.es/elementosWeb/gestionCajas/FOM/Image/caballito.JPG'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
