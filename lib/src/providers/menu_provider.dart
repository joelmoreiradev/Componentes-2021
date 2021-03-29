/* menu_provider.dart es para manejar el archivo
   menu_opts.json y todo lo relacionado a el */

// paquete para leer archivo .json  
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;



class _MenuProvider {

  // Lista dinámica inicializada vacía
  List<dynamic> opciones = [];

  // constructor de la clase
  // el constructor solo se ejecuta la primera vez que se llama la instancia de la clase
  _MenuProvider(){
    // cargarData();
  }


  // método cargarData
  // es una lista que se resolverá en un futuro
  Future< List<dynamic> > cargarData() async {

    // cargar archivo usando la herramienta que viene en el paquete Dart:convert.
    // una vez cargado lo almaceno en la variable resp
   final resp = await rootBundle.loadString('data/menu_opts.json');
  
   /* esta resp del menu_opts.json es un String plano o JSONString con el 
          cual no puedo hacer nada, por eso debo convertirlo en un Map
          ya que con el Map podría trabajar con el y leer una propiedad específica del json */
        
        // Convierto o decodifico el JSONString en un Map
        // Mapa con el cual puedo acceder a propiedades específicas del json
        Map dataMap = json.decode(resp);
        
        // print(dataMap['rutas']);

        // agrego la parte de las rutas del Map en la Lista opciones
        opciones = dataMap['rutas'];
        
        return opciones;

  }


}


// instancia de la clase _MenuProvider
// La idea de esto es tener una única instancia en toda la aplicación.
// puedo acceder a esta instancia desde otras clases importando la clase _MenuProvider
final menuProvider = new _MenuProvider();