import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class MapaEventoPage extends StatelessWidget {
  const MapaEventoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Mapa do evento"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ExtendedImage.asset(
                'assets/img/arte_uergs/Mapa_Campus.png',
                enableLoadState: true,
                mode: ExtendedImageMode.Gesture,
              ),
            ],
          )),
    );
  }
}
