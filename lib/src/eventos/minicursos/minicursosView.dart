import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:siepex/models/minicurso.dart';
import 'package:siepex/src/config.dart';
import 'package:siepex/src/eventos/minicursos/minicursoCard.dart';
import 'package:siepex/src/eventos/widgets/widgets.dart';

class ListagemMinicursos extends StatefulWidget {
  ListagemMinicursos({Key key}) : super(key: key);

  _ListagemMinicursosState createState() => _ListagemMinicursosState();
}

class _ListagemMinicursosState extends State<ListagemMinicursos> {
  List<dynamic> viewMinicursos = [];
  bool falha = false;
  getMinicursos() async {
    try {
      var minicursos =
          jsonDecode((await http.get(baseUrl + "minicursos")).body);
      print(minicursos);
      // print(minicursos.runtimeType);
      setState(() {
        viewMinicursos = minicursos;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // Loading.neverSatisfied(context, true);
    getMinicursos();
    // Loading.neverSatisfied(context, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(viewMinicursos);
    if ((viewMinicursos == null || viewMinicursos.length == 0) /* && !falha*/) {
      return Container(
        child: SpinKitPouringHourglass(
          color: Colors.blueAccent,
          size: 200,
        ),
      );
    } else {
      List<Widget> widgetMinicursos = [];
      String inicio = '0';
      viewMinicursos.forEach((minicurso) {
        if (minicurso['inicio'] != inicio) {
          widgetMinicursos.add(linhaHora(hora: minicurso['inicio']));
          inicio = minicurso['inicio'];
        }
        widgetMinicursos
            .add(MinicursoCard(minicurso: Minicurso().fromJson(minicurso)));
      });
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: widgetMinicursos,
          ));
    }
  }
}
