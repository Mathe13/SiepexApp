import 'package:flutter/material.dart';
import 'package:siepex/src/eventos/trabalhos/trabalhosView.dart';

class TrabalhosDiaPage extends StatelessWidget {
  const TrabalhosDiaPage({Key key, this.dia}) : super(key: key);
  final String dia;

  @override
  Widget build(BuildContext context) {
    // return Text("teste");
    print("chamou dia " + dia);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Color(0xff2595A6),
          appBar: tabs(),
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
                    dia: dia,
                  ),
                  ListagemTrabalhos(area: "CIÊNCIAS HUMANAS", dia: dia),
                  ListagemTrabalhos(
                      area: "CIÊNCIAS DA VIDA E DO MEIO AMBIENTE", dia: dia),
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
