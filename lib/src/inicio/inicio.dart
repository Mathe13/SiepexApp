import 'package:flutter/material.dart';

class GridItem {
  String nome;
  String rota;
  IconData icone;
  GridItem(this.nome, this.rota, this.icone);
}

class InicioPage extends StatelessWidget {
  final Widget child;

  InicioPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return corpo(context);
  }

  Widget corpo(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
        ),
        body: Container(
            child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
            ),
            Row(
              children: <Widget>[
                itemButton(
                    new GridItem('Agenda', 'eventos', Icons.calendar_today),
                    context),
                itemButton(new GridItem('Sobre o Siepex', 'sobre', Icons.info),
                    context)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              children: <Widget>[
                itemButton(
                    new GridItem('Apresentadores', 'palestrantes', Icons.group),
                    context),
                itemButton(new GridItem('Hoteis', 'hoteis', Icons.map), context)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              children: <Widget>[
                itemButton(
                    new GridItem(
                        'Restaurantes', 'restaurantes', Icons.fastfood),
                    context),
                itemButton(
                    new GridItem('Informações úteis', '404', Icons.warning),
                    context)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              children: <Widget>[
                itemButton(
                    new GridItem('Organização', '404', Icons.business_center),
                    context),
                itemButton(
                    new GridItem(
                        'Área do Participante', '404', Icons.assignment_ind),
                    context)
              ],
            )
          ],
        )));
  }

  Widget itemButton(GridItem item, BuildContext context) {
    return Expanded(
        child: FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, item.rota);
      },
      child: Column(
        children: <Widget>[
          Icon(
            item.icone,
            size: 100,
            color: Colors.green[400],
          ),
          Text(item.nome)
        ],
      ),
    ));
  }
}
