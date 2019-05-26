import 'package:flutter/material.dart';

class GridItem {
  String nome;
  String rota;
  IconData icone;
  GridItem(this.nome, this.rota, this.icone);
}

Widget itemButton(GridItem item, BuildContext context, {bool expanded = true}) {
  Widget retorno = FlatButton(
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
              color: Colors.white,
            ),
            Text(
              item.nome,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.white),
              softWrap: true,
            )
          ],
        )),
  );
  if (expanded) {
    return Expanded(
      child: retorno,
      flex: 1,
    );
  } else {
    return retorno;
  }
}
