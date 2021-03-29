import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno','Dos','Tres','Cuatro','Cinco'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta()
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    // Recorre la lista de opciones, opt va a tener el valor de 'Uno','Dos', etc...
    for (String opt in opciones) {

      final tempWidget = ListTile(
        title: Text(opt),
      );

      // Agrego el Widget temporal con los datos de "opciones" al List "Lista" de Widgets
      lista..add(tempWidget)
           ..add(Divider());

    }

    // regreso la lista
    return lista;
  }


  List<Widget> _crearItemsCorta() {

    return opciones.map( (item) {

      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.account_box_rounded),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );

    }).toList();

  }


}