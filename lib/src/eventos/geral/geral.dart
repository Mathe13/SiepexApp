import 'package:flutter/material.dart';
import 'package:siepex/src/eventos/geral/geralView.dart';
import 'package:siepex/src/eventos/minicursos/minicursosView.dart';

class GeralPage extends StatelessWidget {
  const GeralPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Agenda do evento'),
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/img/arte_uergs/Background_App_Siepex.png'),
                      fit: BoxFit.cover)),
              child: TabBarView(
                children: <Widget>[
                  ListagemGeral(dia: "26/06/2019"),
                  ListagemGeral(dia: "27/06/2019"),
                  ListagemGeral(dia: "28/06/2019"),
                ],
              )),
        ));
  }

  Widget tabs() {
    return TabBar(indicatorColor: Colors.white, tabs: [
      Tab(child: Text("26/06")),
      Tab(child: Text("27/06")),
      Tab(child: Text("28/06"))
    ]);
  }
}
