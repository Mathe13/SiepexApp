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
            'https://www.google.com.br/maps/search/hoteis/@-30.0769777,-51.1315835,14z/data=!3m1!4b1',
      ),
    );
  }
}
