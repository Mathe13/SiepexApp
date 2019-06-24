import 'package:flutter/material.dart';
import 'package:siepex/src/eventos/trabalhos/trabalhosDia.dart';

class TrabalhosPage extends StatelessWidget {
  const TrabalhosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Trabalhos '),
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
                  TrabalhosDiaPage(dia: "27/06/2019"),
                  TrabalhosDiaPage(dia: "28/06/2019")
                ],
              )),
        ));
  }

  Widget tabs() {
    return TabBar(indicatorColor: Colors.white, tabs: [
      Tab(child: Text("27/06")),
      Tab(child: Text("28/06")),
    ]);
  }
}
