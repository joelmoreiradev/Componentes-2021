import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      
      body: ListView(
        padding: EdgeInsets.all(10.0),

        children: [
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          
        ],
      ),

    );
  }

 
 
 Widget _cardTipo1() {

   return Card(

     elevation: 10.0,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(5.0) // bordes redondeados
     ),

     child: Column(
       children: [
         ListTile(
           leading: Icon(Icons.photo_album, color: Colors.blue),
           title: Text('Soy el título de esta tarjeta'),
           subtitle: Text('asdjkladsdsaasdljaslkdalksdjalksdjaslkjaslkjdsalkdjlaksdjalksjdasladk'),
         ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: (){},
            ),
            ElevatedButton( // FlatButton deprecated
              child: Text('Ok'),
              onPressed: (){},
            ),
            SizedBox(width: 5.0)
          ],
        ),

       ],
     ),
     
   );

 }

 Widget _cardTipo2() {

   return Card(
    // Evita que el contenido dentro de la tarjeta se salga fuera de la misma
    // ej, no permite que los bordes de una imágen se salgan de una tarjeta con bordes redondeados
     clipBehavior: Clip.antiAlias,

    // Bordes redondeados para la tarjeta
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

     child: Column(
       children: [

         FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://cdn2.wanderlust.co.uk/media/1002/cropped-header.jpg?anchor=center&mode=crop&width=1200&height=0&rnd=131656621890000000'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 300.0,
          fit: BoxFit.cover,
         ),
         Container(
           padding: EdgeInsets.all(10.0),
           child: Text('Un simple texto para rellenar y aparezca un espacio')
         ),
       ],
     ),
   );

 }



}