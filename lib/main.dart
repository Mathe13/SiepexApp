import 'package:flutter/material.dart';
import 'package:siepex/src/agenda/agenda.dart';
import 'package:siepex/src/areaParticipante/alimentacao/alimentacao.dart';
import 'package:siepex/src/areaParticipante/homeParticipante.dart';
import 'package:siepex/src/areaParticipante/meusEventos/meusEventos.dart';
import 'package:siepex/src/areaParticipante/mudasenha.dart';
import 'package:siepex/src/areaParticipante/qr.dart';
import 'package:siepex/src/comissao/comissao.dart';
import 'package:siepex/src/eventos/eventos.dart';
import 'package:siepex/src/eventos/geral/geral.dart';
import 'package:siepex/src/eventos/minicursos/minicursos.dart';
import 'package:siepex/src/eventos/trabalhos/Trabalhos.dart';
import 'package:siepex/src/eventos/visitas/visitas.dart';
import 'package:siepex/src/hoteis/hoteis.dart';
import 'package:siepex/src/info/avisos.dart';
import 'package:siepex/src/info/info.dart';
import 'package:siepex/src/inicio/inicio.dart';
import 'package:siepex/src/login/login.dart';
import 'package:siepex/src/mapa_evento/mapa_evento.dart';
import 'package:siepex/src/notfound.dart';
import 'package:siepex/src/palestrantes/palestrantes.dart';
import 'package:siepex/src/restaurantes/restaurante.dart';
import 'package:siepex/src/sobre/sobre.dart';
import 'package:siepex/src/tabs/tabs.dart';

void main() => runApp(MyApp());

// flutter build --build-number=x --build-name=y
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
        'MapaEvento': (BuildContext context) => MapaEventoPage(),
        'login': (BuildContext context) => LoginPage(),
        "minicursos": (BuildContext context) => MinicursosPage(),
        "visitas": (BuildContext context) => VisitasPage(),
        "meuseventos": (BuildContext context) => MeusEventosPage(),
        "mudasenha": (BuildContext context) => MudaSenhaPage(),
        "avisos": (BuildContext context) => AvisosPage(),
        "geral": (BuildContext context) => GeralPage(),
        "comissao": (BuildContext context) => ComissaoPage(),
        "trabalhos": (BuildContext context) => TrabalhosPage()
      },
      title: 'Siepex App',
      theme: ThemeData(
        textSelectionColor: Colors.white,
        primaryColor: Color(0xff2595A6),
        primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
        textTheme: Typography(platform: TargetPlatform.iOS).white,
        // backgroundColor: Colors.green[30],
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      // home: TabsPage(),
    );
  }
}
