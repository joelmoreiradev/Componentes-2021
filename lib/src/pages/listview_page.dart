import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  // ScrollController que será usado para controlar cuando se llega al final de la página
  ScrollController _scrollController = new ScrollController();


  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  // Este método se ejecuta al "cargar" el StatefulWidget.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _agregar10();

    // añadir un Listener al _scrollController
    _scrollController.addListener(() { 
        // print('Scroll!');

      // Si la posición del _scrollController en pixeles es exactamente igual al largo máximo posible de Scroll
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _agregar10(); // Agrego 10 imágenes más
        fetchData();
      }

    });

  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // vaciar o deshechar el _scrollController cuando salgo de la página
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),

      // El stack "apila" un elemento arriba de otro
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }



  Widget _crearLista() {

    return RefreshIndicator(

        onRefresh: obtenerPagina1,

        child: ListView.builder(

        // "Enlazo" el _scrollController al ListView.builder()
        controller: _scrollController,

        // El largo de _listaNumeros definirá la cantidad de items del ListView.builder()
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {

          final imagen = _listaNumeros[index]; // 1,2,3,4,5

          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/500/400?image=$imagen')
          );
        },

      ),
    );

  }



  Future<Null> obtenerPagina1() async {

    final duration = new Duration( seconds: 2);
    new Timer(duration, () {

      _listaNumeros.clear(); // borrar la lista de números
      _ultimoItem++; // sumar en uno para tener nuevas imágenes
      _agregar10(); // agregar 10 imágenes

    });

    return Future.delayed(duration);

  }


  // Cada vez que llame a este método, va agregar 10 imágenes a la lista
  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);

      setState(() {});
    }
  }

  Future<void> fetchData() async {

    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);

  }


  void respuestaHTTP(){

    _isLoading = false;

    // Mover el scroll 100 pixels hacia abajo para mostrar los nuevos registros/fotos
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: new Duration(milliseconds: 400),
    );



    _agregar10();

  }

 Widget _crearLoading() {

   if(_isLoading) {
     return Center(
       child: Container(
         width: 200,
         height: 200,
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('Cargando, espere...', style: TextStyle(fontSize: 20)),
               SizedBox(height: 20.0),
               CircularProgressIndicator(),
             ],
           ),
           
         ),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: Color.fromRGBO(237, 237, 237, 1)
         ),
       ),
     );
   } else {
     return Container(); 
   }

 }

}