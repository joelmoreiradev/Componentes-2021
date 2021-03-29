import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

import 'alert_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),

      ),
      body: _lista(),
    );
  }

 
 
 Widget _lista() {

   return FutureBuilder(
    // defino el Future que va a escuchar o usar para construir datos el FutureBuilder
     future: menuProvider.cargarData(),
     initialData: [], // esto evita el error de "The method 'forEach' was called on null."
     builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
      //  Este builder se dispara en varias estapas: cuando estoy recibiendo datos, cuando ya se obtuvieron los datos, cuando hay un error.  
      // El builder debe de regresar un widget.
      return ListView(
        children: _listaItems(snapshot.data, context),
      );
     },
   );

  //  return ListView(
  //    children: _listaItems(),
  //  );

 }

// La lista recibe los datos del snapshot.data
// y voy a usar esos datos para crear los items.
 List<Widget> _listaItems(List <dynamic> data, BuildContext context) {
   
   final List<Widget> opciones = [];

  //  if(data == null) {return [];}

   data.forEach( (opt) { 
     final widgetTemp = ListTile(
       title: Text(opt['texto']),
       leading: getIcon(opt['icon']),
       trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
     
     onTap: (){

       Navigator.pushNamed(context, opt['ruta']);
      //  final route = MaterialPageRoute(
      //    builder: (context) => AlertPage()
      //  );
      //  Navigator.push(context, route);
     },
     );

     opciones..add(widgetTemp)
             ..add(Divider());
   });

    return opciones;

 }


}