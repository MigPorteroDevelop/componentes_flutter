import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//Capturamos los datos del input en el state con una nueva propiedad.

  String _nombre = '';
  String _email = '';
  String _fecha = '';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //Con .lenght podemos saber a tiempo real el número de letras usadas.
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo el nombre',
          suffixIcon: Icon(Icons.accessibility_new),
          icon: Icon(Icons.account_circle)),
      //Recibe un metodo donde está el valor de la caja de texto.
      onChanged: (valor) {
        //Al cambiar el nombre, no aparece en el método crearPersona,
        //hasta hacer un hot reload, para redibujar un widget hay que
        //llamar al setState.
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      //Recibe un metodo donde está el valor de la caja de texto.
      onChanged: (valor) {
        //Al cambiar el nombre, no aparece en el método crearPersona,
        //hasta hacer un hot reload, para redibujar un widget hay que
        //llamar al setState.
        setState(() {
          _email = valor;
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock_open)),
      //Recibe un metodo donde está el valor de la caja de texto.
      onChanged: (valor) {
        //Al cambiar el nombre, no aparece en el método crearPersona,
        //hasta hacer un hot reload, para redibujar un widget hay que
        //llamar al setState.
        setState(() {
          _email = valor;
        });
      },
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.date_range),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        //Para quitar el foco del input.
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    //
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1980),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    //Mostrar lo seleccionado en el input con una validación.
    //Si está seleccionada una fecha voy a colocar el valor en la caja
    //de texto, con el setState decimos al widget que hay que redibujarse
    //con el valor que yo le voy a asignar.
    //
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        //Rellena el campo con la fecha seleccionada.
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  _crearPersona() {
    return ListTile(
      title: Text('El nombre es :$_nombre'),
      subtitle: Text('El email es :$_email'),
    );
  }
}
