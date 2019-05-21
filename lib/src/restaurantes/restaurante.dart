// https://www.google.com.br/maps/search/comida/@-30.0784113,-51.1507375,13z
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class RestaurantesPage extends StatelessWidget {
  final Widget child;

  RestaurantesPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurantes"),
      ),
      body: WebviewScaffold(
        url:
            'https://www.google.com.br/maps/search/UERGS+-+Campus+Central+restaurantes/@-30.0773608,-51.1561728,12z/data=!3m1!4b1z',
      ),
    );
  }
}
