import 'package:flutter/material.dart';
import 'package:siepex/models/geral.dart';
import 'package:siepex/models/trabalho.dart';
import 'package:siepex/src/eventos/trabalhos/trabalhosDetalhes.dart';

class TrabalhosCard extends StatelessWidget {
  final Trabalho trabalho;
  final bool cadastro;
  const TrabalhosCard({Key key, this.cadastro = true, this.trabalho})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TrabalhoDetalhes(
                          trabalho: trabalho,
                        )));
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Color(0xff249FAB),
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 70,
                              height: 70,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new NetworkImage(
                                          "https://avatars1.githubusercontent.com/u/29609021?s=400&u=24a2c965697b52e2697feb03ec808aa9b1b32443&v=4")))),
                          new Text(trabalho.autor.substring(0, 10) + "...")
                        ],
                      )),
                  Expanded(
                    flex: 3,
                    child: Container(
                        margin: EdgeInsets.only(top: 0),
                        child: ListTile(
                          title: Text(trabalho.titulo),
                          subtitle: Text(
                              '${trabalho.hora}\nLocal:${trabalho.predioSala}'),
                        )),
                  )
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          )),
    );
  }
}
