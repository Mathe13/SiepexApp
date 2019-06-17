import 'package:flutter/material.dart';
import 'package:siepex/utils/percentage_helper.dart';

class GridItem {
  String nome;
  String rota;
  IconData icone;
  GridItem(this.nome, this.rota, this.icone);
}

Widget itemButton(GridItem item, BuildContext context,
    {bool expanded = true, Future<dynamic> func(), bool function = false}) {
  Widget retorno = FlatButton(
    onPressed: () {
      if (function) {
        func();
      } else {
        Navigator.pushNamed(context, item.rota);
      }
    },
    child: Container(
        height: PercentageHelper.height(15, context),
        width: PercentageHelper.width(25, context),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black54, spreadRadius: 0.8, blurRadius: 2)
            ],
            // border: Border.all(color: Colors.black),
            color: Color(0xff249FAB),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Icon(
              item.icone,
              size: 70,
              color: Colors.white,
              // semanticLabel: 'fjhdjkfhdjkfhjk',
            ),
            Text(
              item.nome,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
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
