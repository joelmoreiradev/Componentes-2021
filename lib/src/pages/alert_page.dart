import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),

      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlerta(context),
         ),
      ),
      

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backpack),
        onPressed: () {
          Navigator.pop(context);
        }
      ),
    );
  }

  // Método para mostrar un AlertDialog
  void _mostrarAlerta(BuildContext context) {
    /* configuración de la alerta (debe recibir el context y 
    en el builder regresar un Widget que en este caso es AlertDialog() ) */
    showDialog(
      context: context,
      barrierDismissible: false, // permitir que se pueda cerrar tocando fuera de la tarjeta
      builder: (context) {
        return AlertDialog(
          // shape: , // también se le puede aplicar bordes redondeados
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Hacer que la columna ocupe el mínimo espacio posible (que se adapte a su contenido)
            children: [
               Text('Este es el contenido de la caja de la alerta'),
              //  SizedBox(height: 10.0),
              //  Row(
              //    mainAxisAlignment: MainAxisAlignment.end, // Alinear al final (derecha)
              //    children: [
              //    TextButton(onPressed: () {}, child: Text('Cancelar')),
              //    SizedBox(width: 5.0),
              //    ElevatedButton(onPressed: (){}, child: Text('Aceptar')),

              //  ]),
              
            ],
          ),
          // acciones de la alerta (ubica los botones abajo a la derecha)
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancelar')),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: Text('Aceptar')),
          ],
        );
      }

    );
  }

}