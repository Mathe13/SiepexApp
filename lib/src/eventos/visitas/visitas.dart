import 'package:flutter/material.dart';
import 'package:siepex/src/eventos/visitas/visitasView.dart';

class VisitasPage extends StatelessWidget {
  const VisitasPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Visitas Técnicas 26/06"),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: () {
          //       print('pesquisa');
          //     },
          //   )
          // ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img/arte_uergs/Background_App_Siepex.png'),
                    fit: BoxFit.cover)),
            child: ListagemVisitas()),
      ),
    );
  }
}
