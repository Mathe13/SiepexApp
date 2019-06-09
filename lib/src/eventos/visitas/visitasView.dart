import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:siepex/models/minicurso.dart';
import 'package:siepex/models/visitas.dart';
import 'package:siepex/src/config.dart';
import 'package:siepex/src/eventos/minicursos/minicursoCard.dart';
import 'package:siepex/src/eventos/visitas/visitasCard.dart';
import 'package:siepex/src/eventos/widgets/widgets.dart';

class ListagemVisitas extends StatefulWidget {
  ListagemVisitas({Key key}) : super(key: key);

  _ListagemVisitasState createState() => _ListagemVisitasState();
}

class _ListagemVisitasState extends State<ListagemVisitas> {
  List<dynamic> viewVisitas = [];
  bool falha = false;
  getVisitas() async {
    try {
      var visitas = jsonDecode((await http.get(baseUrl + "visitas")).body);
      print(visitas);
      print(visitas.runtimeType);
      setState(() {
        viewVisitas = visitas;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // Loading.neverSatisfied(context, true);
    getVisitas();
    // Loading.neverSatisfied(context, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(viewVisitas);
    if ((viewVisitas == null || viewVisitas.length == 0) /* && !falha*/) {
      return Container(
        child: SpinKitPouringHourglass(
          color: Colors.blueAccent,
          size: 200,
        ),
      );
    } else {
      List<Widget> widgetVisitas = [];
      String saida = '0';
      viewVisitas.forEach((visita) {
        if (visita['saida'] != saida) {
          widgetVisitas.add(linhaHora(hora: visita['saida']));
          saida = visita['saida'];
        }
        widgetVisitas.add(VisitasCard(visita: new Visita.fromJson(visita)));
      });
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: widgetVisitas,
          ));
    }
  }
}
