import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:siepex/src/config.dart';

class ListagemComissao extends StatefulWidget {
  ListagemComissao({Key key}) : super(key: key);
  _ListagemComissaoState createState() => _ListagemComissaoState();
}

class _ListagemComissaoState extends State<ListagemComissao> {
  bool carregou = false;
  List<dynamic> comissao = [];

  @override
  void initState() {
    // TODO: implement initState
    getComissao();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> lista = [];

    if (carregou == false) {
      return Container(
        child: SpinKitWave(
          color: Colors.blueAccent,
          size: 200,
        ),
      );
    } else if (comissao.length == 0 && carregou == true) {
      lista.add(Image.asset(
        'assets/img/arte_uergs/Logo-Siepex-sobre.png',
        fit: BoxFit.cover,
        // width: 20,
      ));
      return Text("nada a ser exibido");
    } else {
      lista.add(Image.asset(
        'assets/img/arte_uergs/Logo-Siepex-sobre.png',
        fit: BoxFit.cover,
        // width: 20,
      ));
      comissao.forEach((f) {
        lista.add(AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: ListTile(
              title: Text(
                f['funcao'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(f['nome']),
            )));
      });
      return ListView(children: lista);
    }
  }

  getComissao() async {
    try {
      var retorno = jsonDecode((await http.get(baseUrl + "comissao")).body);
      print(retorno);
      setState(() {
        comissao = retorno;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        carregou = true;
      });
    }
  }
}
