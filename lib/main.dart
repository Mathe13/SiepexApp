import 'package:flutter/material.dart';
import 'package:siepex/src/agenda/agenda.dart';
import 'package:siepex/src/areaParticipante/alimentacao/alimentacao.dart';
import 'package:siepex/src/areaParticipante/homeParticipante.dart';
import 'package:siepex/src/areaParticipante/qr.dart';
import 'package:siepex/src/eventos/eventos.dart';
import 'package:siepex/src/hoteis/hoteis.dart';
import 'package:siepex/src/info/info.dart';
import 'package:siepex/src/inicio/inicio.dart';
import 'package:siepex/src/notfound.dart';
import 'package:siepex/src/palestrantes/palestrantes.dart';
import 'package:siepex/src/restaurantes/restaurante.dart';
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
        'eventos': (BuildContext context) => EventosPage(),
        'agenda': (BuildContext context) => AgendaPage(),
        'sobre': (BuildContext context) => SobrePage(),
        'palestrantes': (BuildContext context) => PalestrantesPage(),
        'inicio': (BuildContext context) => InicioPage(),
        'hoteis': (BuildContext context) => HoteisPage(),
        'restaurantes': (BuildContext context) => RestaurantesPage(),
        'info': (BuildContext context) => InfoPage(),
        'homeParticipante': (BuildContext context) => HomeParticipante(),
        'qr': (BuildContext context) => QrPage(),
        '404': (BuildContext context) => NotFoundPage(),
        'alimentacao': (BuildContext context) => AlimentacaoPage(),
      },
      title: 'WebAr',
      theme: ThemeData(
        primaryColor: Color(0xff055E3E),
        backgroundColor: Colors.green[30],
        // pageTransitionsTheme: PageTransitionsTheme(builders: {
        //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        // }),
      ),
      // home: TabsPage(),
    );
  }
}
