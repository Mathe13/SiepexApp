import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:siepex/models/participante.dart';
import 'package:siepex/models/visitas.dart';
import 'package:siepex/src/config.dart';
import 'package:siepex/src/eventos/visitas/visitasCard.dart';
import 'package:siepex/src/eventos/widgets/widgets.dart';

class ListagemVisitas extends StatefulWidget {
  ListagemVisitas({Key key, this.total = true}) : super(key: key);
  final bool total;

  _ListagemVisitasState createState() => _ListagemVisitasState();
}

class _ListagemVisitasState extends State<ListagemVisitas> {
  List<dynamic> viewVisitas = [];
  bool carregou = false;
  getTodasVisitas() async {
    try {
      var visitas = jsonDecode((await http.get(baseUrl + "visitas")).body);
      print(visitas);
      print(visitas.runtimeType);
      setState(() {
        viewVisitas = visitas;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        carregou = true;
      });
    }
  }

  getMinhasVisitas() async {
    Participante.getStorage().then((user) async {
      try {
        var visitas = jsonDecode(
            (await http.get(baseUrl + "participante/${user.id}/visitas")).body);
        setState(() {
          print(visitas);
          viewVisitas = visitas['tbl_visitas'];
        });
      } catch (e) {
        print("erro");
        print(e);
      } finally {
        setState(() {
          carregou = true;
        });
      }
    });
  }

  @override
  void initState() {
    if (widget.total) {
      getTodasVisitas();
    } else {
      getMinhasVisitas();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(viewVisitas);
    if (carregou == false) {
      return Container(
        child: SpinKitWave(
          color: Colors.blueAccent,
          size: 200,
        ),
      );
    } else if (viewVisitas.length == 0 && carregou == true) {
      return Text("nada a ser exibido");
    } else {
      List<Widget> widgetVisitas = [];
      String saida = '0';
      viewVisitas.forEach((visita) {
        if (visita['saida'] != saida) {
          widgetVisitas.add(linhaHora(hora: visita['saida']));
          saida = visita['saida'];
        }
        widget.total
            ? widgetVisitas
                .add(VisitasCard(visita: new Visita.fromJson(visita)))
            : widgetVisitas.add(VisitasCard(
                visita: new Visita.fromJson(visita),
                cadastra: false,
              ));
      });
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: widgetVisitas,
          ));
    }
  }
}
