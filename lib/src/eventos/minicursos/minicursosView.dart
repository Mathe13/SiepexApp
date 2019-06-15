import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:siepex/models/minicurso.dart';
import 'package:siepex/models/participante.dart';
import 'package:siepex/src/config.dart';
import 'package:siepex/src/eventos/minicursos/minicursoCard.dart';
import 'package:siepex/src/eventos/widgets/widgets.dart';

class ListagemMinicursos extends StatefulWidget {
  ListagemMinicursos({Key key, this.total = true}) : super(key: key);
  final bool total;
  _ListagemMinicursosState createState() => _ListagemMinicursosState();
}

class _ListagemMinicursosState extends State<ListagemMinicursos> {
  List<dynamic> viewMinicursos = [];
  bool carregou = false;
  getTodosMinicursos() async {
    try {
      var minicursos =
          jsonDecode((await http.get(baseUrl + "minicursos")).body);
      print(minicursos);
      setState(() {
        viewMinicursos = minicursos;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        carregou = true;
      });
    }
  }

  getMeusMinicursos() async {
    Participante.getStorage().then((user) async {
      try {
        var minicursos = jsonDecode(
            (await http.get(baseUrl + "participante/${user.id}/minicursos"))
                .body);
        setState(() {
          print(minicursos);
          viewMinicursos = minicursos['tbl_minicursos'];
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
      print("geral");
      getTodosMinicursos();
    } else {
      print("especifico");
      getMeusMinicursos();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(viewMinicursos);
    if (carregou == false) {
      return Container(
        //pourinhourglass
        //fadingfour
        child: SpinKitWave(
          color: Colors.blueAccent,
          size: 200,
        ),
      );
    } else if (viewMinicursos.length == 0 && carregou == true) {
      return Text("nada a ser exibido");
    } else {
      List<Widget> widgetMinicursos = [];
      String inicio = '0';
      viewMinicursos.forEach((minicurso) {
        if (minicurso['inicio'] != inicio) {
          widgetMinicursos.add(linhaHora(hora: minicurso['inicio']));
          inicio = minicurso['inicio'];
        }
        widgetMinicursos.add(MinicursoCard(
          minicurso: Minicurso().fromJson(minicurso),
          cadastro: widget.total,
        ));
      });
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: widgetMinicursos,
          ));
    }
  }
}
