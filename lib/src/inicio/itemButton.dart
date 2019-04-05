import 'package:flutter/material.dart';

class GridItem {
  String nome;
  String rota;
  IconData icone;
  GridItem(this.nome, this.rota, this.icone);
}

Widget itemButton(GridItem item, BuildContext context) {
  return Expanded(
      flex: 1,
      child: FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, item.rota);
        },
        child: Container(
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: Column(
              children: <Widget>[
                Icon(
                  item.icone,
                  size: 70,
                  color: Colors.green[400],
                ),
                Text(
                  item.nome,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11),
                  softWrap: true,
                )
              ],
            )),
      ));
}
