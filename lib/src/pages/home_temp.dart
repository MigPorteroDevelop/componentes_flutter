import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Listtile title'),
          ),
          Divider(),
          ListTile(
            title: Text('Listtile title'),
          ),
          Divider(),
          ListTile(
            title: Text('Listtile title'),
          ),
        ],
      ),
    );
  }
}
