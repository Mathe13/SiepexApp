import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:siepex/models/trabalho.dart';
import 'package:siepex/src/config.dart';
import 'package:siepex/src/eventos/trabalhos/trabalhosCard.dart';
import 'package:siepex/src/eventos/widgets/widgets.dart';

class ListagemTrabalhos extends StatefulWidget {
  ListagemTrabalhos({Key key, this.total = true, this.area, this.dia})
      : super(key: key);
  final String area;
  final String dia;
  final bool total;
  _ListagemTrabalhosState createState() => _ListagemTrabalhosState();
}

class _ListagemTrabalhosState extends State<ListagemTrabalhos> {
  List<dynamic> viewTrabalhos = [];
  bool carregou = false;
  getGeral() async {
    try {
      var trabalhos = jsonDecode((await http.get(baseUrl + "trabalhos")).body);
      setState(() {
        viewTrabalhos = trabalhos;
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
    } else if (viewTrabalhos.length == 0 && carregou == true) {
      return Text("nada a ser exibido");
    } else {
      List<Widget> widgeTrabalhos = [];
      String inicio = '0';
      viewTrabalhos.forEach((geral) {
        if (geral['area_ensino'] == widget.area && geral['dia'] == widget.dia) {
          if (geral['hora'] != inicio) {
            print("muda");
            widgeTrabalhos.add(linhaHora(hora: geral['hora']));
            inicio = geral['hora'];
          }
          widgeTrabalhos.add(TrabalhosCard(
            trabalho: Trabalho().fromJson(geral),
            cadastro: widget.total,
          ));
        }
      });
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: widgeTrabalhos,
          ));
    }
  }
}
