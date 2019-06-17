import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:siepex/models/geral.dart';
import 'package:siepex/src/config.dart';
import 'package:siepex/src/eventos/geral/geralCard.dart';
import 'package:siepex/src/eventos/widgets/widgets.dart';

class ListagemGeral extends StatefulWidget {
  ListagemGeral({Key key, this.total = true, this.dia}) : super(key: key);
  final String dia;
  final bool total;
  _ListagemGeralState createState() => _ListagemGeralState();
}

class _ListagemGeralState extends State<ListagemGeral> {
  List<dynamic> viewGeral = [];
  bool carregou = false;
  getGeral() async {
    try {
      var geral = jsonDecode((await http.get(baseUrl + "geral")).body);
      // print(geral);
      setState(() {
        viewGeral = geral;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        carregou = true;
      });
    }
  }

  @override
  void initState() {
    getGeral();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(viewGeral);
    if (carregou == false) {
      return Container(
        child: SpinKitWave(
          color: Colors.blueAccent,
          size: 200,
        ),
      );
    } else if (viewGeral.length == 0 && carregou == true) {
      return Text("nada a ser exibido");
    } else {
      List<Widget> widgetGeral = [];
      String inicio = '0';
      viewGeral.forEach((geral) {
        // print(widget.dia);
        // print(geral['dia']);
        if (geral['dia'] == widget.dia) {
          if (geral['inicio'] != inicio) {
            widgetGeral.add(linhaHora(hora: geral['inicio'].substring(0, 5)));
            inicio = geral['inicio'];
          }
          widgetGeral.add(GeralCard(
            geral: Geral().fromJson(geral),
            cadastro: widget.total,
          ));
        }
      });
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: widgetGeral,
          ));
    }
  }
}
