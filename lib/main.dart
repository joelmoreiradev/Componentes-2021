import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Esto es para tener el DatePicker en Español
      localizationsDelegates: [
      // ... app-specific localization delegate[s] here
      // TODO: uncomment the line below after codegen
      // AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
      const Locale('en', ''), // English, no country code
      const Locale('es', 'ES'), // Spanish SPAIN
      
      // ... other locales the app supports
      ],

      title: 'Componentes App',
      // home: HomePage(),

      // Rutas de la aplicación para usar con el Navigator.pushNamed
      initialRoute: '/',
      routes: getApplicationRoutes(), // método de routes/routes.dart

      // redirigir a una ruta cuando se intente ir a una que no está definida
      onGenerateRoute: (RouteSettings settings) {

        print('Ruta llamada: ${settings.name}');

        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );

      },


    );
  }
}