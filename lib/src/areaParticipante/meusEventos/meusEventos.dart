import 'package:flutter/material.dart';
import 'package:siepex/models/participante.dart';
import 'package:siepex/src/eventos/minicursos/minicursosView.dart';
import 'package:siepex/src/eventos/visitas/visitas.dart';
import 'package:siepex/src/eventos/visitas/visitasView.dart';

class MeusEventosPage extends StatefulWidget {
  MeusEventosPage({Key key}) : super(key: key);
  _MeusEventosPageState createState() => _MeusEventosPageState();
}

class _MeusEventosPageState extends State<MeusEventosPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meus Eventos'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('pesquisa');
                },
              )
            ],
            bottom: tabs(),
          ),
          body: Container(
              child: TabBarView(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/img/arte_uergs/Background_App_Siepex.png'),
                          fit: BoxFit.cover)),
                  child: ListagemMinicursos(total: false)),
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/img/arte_uergs/Background_App_Siepex.png'),
                          fit: BoxFit.cover)),
                  child: ListagemVisitas(total: false)),
              // AgendaDia(),
            ],
          )),
        ));
  }

  Widget tabs() {
    return TabBar(indicatorColor: Colors.white,
        // labelPadding: EdgeInsets.zero,
        tabs: [
          Tab(child: Text("Minicursos")),
          Tab(child: Text("Visitas")),
          // Tab(child: Text("28/06"))
        ]);
  }
}
