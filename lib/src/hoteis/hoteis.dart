import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HoteisPage extends StatelessWidget {
  final Widget child;

  HoteisPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hoteis"),
      ),
      body: WebviewScaffold(
        url:
            'https://www.google.com.br/maps/search/UERGS+-+Campus+Central+hoteis+proximos/@-30.0773739,-51.1561728,12.75z',
      ),
    );
  }
}
