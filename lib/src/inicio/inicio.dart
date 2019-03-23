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
            // decoration: ShapeDecoration(
            //   shape: BeveledRectangleBorder(),
            // ),
            // decoration: new BoxDecoration(
            //   shape: BoxShape.circle,
            //   border: new Border.all(
            //     color: Colors.black,
            //     width: 1.0,
            //   ),
            // ),
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
            ),
            Row(
              children: <Widget>[
                itemButton(
                    new GridItem(
                        'Agenda do evento', 'agenda', Icons.calendar_today),
                    context),
                itemButton(
                    new GridItem('Sobre o Siepx', 'sobre', Icons.info), context)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              children: <Widget>[
                itemButton(
                    new GridItem(
                        'Palestrantes do ano', 'palestrantes', Icons.group),
                    context),
                itemButton(new GridItem('Hoteis', '404', Icons.map), context)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              children: <Widget>[
                itemButton(new GridItem('Restaurantes', '404', Icons.fastfood),
                    context),
                itemButton(
                    new GridItem('Informações úteis', '404', Icons.warning),
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
