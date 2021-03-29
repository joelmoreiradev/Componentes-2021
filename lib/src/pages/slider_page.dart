import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {


  double _valorSlider = 0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imágen: ${_valorSlider.toInt()}',
      divisions: 1000,

      // expresión ternaria, si _bloquearCheck está activo regreso null, caso contrario llamo el método siguiente.
      onChanged: (_bloquearCheck) ? null : (valor) {

        setState(() {
          _valorSlider = valor;
          print(_valorSlider);
        });
      
      },
      min: 0,
      max: 400,
      value: _valorSlider,
    );
  }

 Widget _crearImagen() {

   return Image(
     image: NetworkImage('https://flutter.dev/assets/showcase/cards/tencent-top-1200-158ecac1430380119d57cb2074a303f8de3c1a348449c7da47a76d9308fdda17.jpg'),
     width: _valorSlider,
     fit: BoxFit.contain,
   );

 }

 Widget _checkBox() {
   
  //  return Checkbox(
    //  value: _bloquearCheck, 
    //  onChanged: (valor){
      //  _bloquearCheck = valor;
      //  setState(() {
        //  print(_bloquearCheck);
      //  });
    //  }
  //  );

  return CheckboxListTile(
    value: _bloquearCheck,
    title: Text('Bloquear Slider'),
    subtitle: Text('Esto bloqueará el Slider'), 
    onChanged: (valor){
       setState(() {
         print(_bloquearCheck);
        _bloquearCheck = valor;
       });
     }
  );

 }

 Widget _crearSwitch() {

   return SwitchListTile( 
    value: _bloquearCheck,
    title: Text('Bloquear Slider'),
    subtitle: Text('También bloquea el Slider, pero con un switch :)'), 
    onChanged: (valor){
       setState(() {
         print(_bloquearCheck);
        _bloquearCheck = valor;
       });
     }
  );



 }


}