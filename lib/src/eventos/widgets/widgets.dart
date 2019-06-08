import 'package:flutter/material.dart';

Widget linhaHora({String hora = "00:00"}) {
  return Container(
    width: 300,
    child: Text(
      hora,
      style: TextStyle(fontSize: 25),
      textAlign: TextAlign.right,
    ),
    decoration:
        BoxDecoration(border: Border(bottom: BorderSide(color: Colors.green))),
  );
}
