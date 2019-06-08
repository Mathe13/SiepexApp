import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {
  static Future<void> neverSatisfied(BuildContext context, load) async {
    if (load) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text(
                'Carregando',
                textAlign: TextAlign.center,
              ),
              content: Container(
                alignment: Alignment.center,
                width: 70.0,
                height: 70.0,
                child: SpinKitChasingDots(
                  color: Colors.blueAccent,
                  size: 60,
                ),
              ));
        },
      );
    } else {
      Navigator.of(context).pop();
    }
  }
}
