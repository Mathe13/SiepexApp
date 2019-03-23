import 'package:flutter/material.dart';
import 'package:siepex/src/agenda/agenda.dart';
import 'package:siepex/src/inicio/inicio.dart';
import 'package:siepex/src/notfound.dart';
import 'package:siepex/src/palestrantes/palestrantes.dart';
import 'package:siepex/src/sobre/sobre.dart';
import 'package:siepex/src/tabs/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'inicio',
      routes: <String, WidgetBuilder>{
        'tabs': (BuildContext context) => TabsPage(),
        'agenda': (BuildContext context) => AgendaPage(),
        'sobre': (BuildContext context) => SobrePage(),
        'palestrantes': (BuildContext context) => PalestrantesPage(),
        'inicio': (BuildContext context) => InicioPage(),
        '404': (BuildContext context) => NotFoundPage(),
      },
      title: 'WebAr',
      theme: ThemeData(
        primaryColor: Color(0xff055E3E),
        backgroundColor: Colors.green[30],
        // pageTransitionsTheme: PageTransitionsTheme(builders: {
        //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        // }),
      ),
      home: TabsPage(),
    );
  }
}
