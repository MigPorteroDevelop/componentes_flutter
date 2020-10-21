import 'package:flutter/material.dart';
import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:componentes_flutter/src/utils/iconos_util.dart';
import 'package:componentes_flutter/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      //Creamos un ListView con un método llamado lista
      body: _lista(),
    );
  }

  Widget _lista() {
    //El FutureBuilder permite dibujarse a si mismo basado en el último
    //snapshot que interactuó con un Future. Tiene varios estados, cuando
    //se está pidiendo información, cuando se resuelve o da un error.
    return FutureBuilder(
      future: menuProvider.cargarData(),
      //Es opcional, información que va a tener por defecto mientras no se
      //resuelve el future, como por ejemplo una lista vacía.
      initialData: [],
      //Con el AsyncSnapshot que es del tipo de la respuesta que tengo en
      //mi future, que es una lista de tipo dinámico.
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //Leemos un archivo json para agregar todas las opciones y
        //renderizarlas.
        return ListView(
          //Creamos un método _listaItems, regresa los items
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  //Regresa una lista de items
  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_right, color: Colors.blueAccent),
        onTap: () {
          //Creamos una ruta a una página determinada.
          //Recibe el context que contiene la referencia a las páginas
          //y otras cosas globales de la app.
          /*final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route);*/

          //Llamamos a un pushNamed, cuyo nombre de ruta tiene que estar
          //definido en las rutas del main.
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
