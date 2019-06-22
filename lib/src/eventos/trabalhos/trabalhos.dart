import 'package:flutter/material.dart';
import 'package:siepex/src/eventos/geral/geralView.dart';
import 'package:siepex/src/eventos/trabalhos/trabalhosView.dart';

class TrabalhosPage extends StatelessWidget {
  const TrabalhosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Trabalhos 28/06'),
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
                  ListagemTrabalhos(
                    area: "CIÊNCIAS EXATAS",
                  ),
                  ListagemTrabalhos(
                    area: "CIÊNCIAS HUMANAS",
                  ),
                  ListagemTrabalhos(
                    area: "CIÊNCIAS DA VIDA E DO MEIO AMBIENTE",
                  ),
                ],
              )),
        ));
  }

  Widget tabs() {
    return TabBar(indicatorColor: Colors.white, tabs: [
      Tab(child: Text("Exatas")),
      Tab(child: Text("Humanas")),
      Tab(child: Text("Vida/Meio Ambiente"))
    ]);
  }
}
