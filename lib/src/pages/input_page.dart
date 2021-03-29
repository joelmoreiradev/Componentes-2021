import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";
  String _opcionSeleccionada = " - ";

  List<String> _poderes = ['volar', 'rayos X', 'super aliento', 'super fuerza'];
  
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
          
        ],
      ),
    );
  }

 Widget _crearInput() {

   return TextField(
    //  autofocus: true, // automáticamente abrir el teclado al entrar a esta página
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),

      counter: Text('Caracteres: ${_nombre.length}'),
      hintText: 'Nombre de la persona',
      labelText: 'Nombre',
      helperText: 'Sólamente el nombre',
      suffixIcon: Icon(Icons.accessibility),
      icon: Icon(Icons.account_circle)
    ),

    onChanged: (valor){
      _nombre = valor;
      setState(() {
        
      });
    },
   );

 }

 Widget _crearPersona() {
   return ListTile(
     title: Text('Nombre: $_nombre'),
     subtitle: Text('El correo es: $_email'),
     trailing: Text(_opcionSeleccionada),
   );
 }

 Widget _crearEmail() {

   return TextField(
    //  autofocus: true, // automáticamente abrir el teclado al entrar a esta página
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      hintText: 'Tu correo',
      labelText: 'Email',
      // helperText: 'correo@ejemplo.com',
      suffixIcon: Icon(Icons.alternate_email),
      icon: Icon(Icons.email)
    ),

    onChanged: (valor){
      _email = valor;
      setState(() {
        
      });
    },
   );

 }

 Widget _crearPassword() {

   return TextField(
    //  autofocus: true, // automáticamente abrir el teclado al entrar a esta página
      obscureText: true,
      decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      hintText: '**************',
      labelText: 'Contraseña',
      helperText: 'Mínimo 6 caracteres',
      // helperText: 'correo@ejemplo.com',
      suffixIcon: Icon(Icons.security),
      icon: Icon(Icons.lock)
    ),

    onChanged: (valor){
      _password = valor;
      setState(() {
        
      });
    },
   );


 }

 Widget _crearFecha(BuildContext context) {

   return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      hintText: 'Fecha de nacimiento',
      labelText: 'Fecha de nacimiento',
      suffixIcon: Icon(Icons.calendar_today),
      icon: Icon(Icons.date_range_outlined)
    ),

    onTap: (){

      FocusScope.of(context).requestFocus(new FocusNode());
      _selectDate(context);

    },
   );

 }

   _selectDate(BuildContext context) async {

     DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2015), 
      lastDate: new DateTime(2025),
      locale: Locale('es','ES')
     );

     if(picked != null) {
       setState(() {
         _fecha = picked.toString();
         _inputFieldDateController.text = _fecha;
       });
     }

  }


 List<DropdownMenuItem<String>> getOpcionesDropdown () {
   List<DropdownMenuItem<String>> lista = new List();

   _poderes.forEach((poder) { 
     lista.add(DropdownMenuItem(
       child: Text(poder),
       value: poder,
     ));
   });


   return lista;
 }

 

 Widget _crearDropdown() {

    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            items: getOpcionesDropdown(),
            //  value: _opcionSeleccionada, // valor que va a mostrar el dropdown
            hint: Text(_opcionSeleccionada),
            onChanged: (opcion) {
             // asigno el valor de opcion a _opcionSeleccionada.
              _opcionSeleccionada = opcion;
              print(opcion);
              setState(() {});
            },
          ),
        ),
      ],
    );


     
 }

}