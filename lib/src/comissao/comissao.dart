import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siepex/src/comissao/listagemComissao.dart';

class ComissaoPage extends StatelessWidget {
  final Widget child;

  ComissaoPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Comissão Organizadora'),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img/arte_uergs/Background_App_Siepex.png'),
                    fit: BoxFit.fill)),
            child: ListagemComissao()));
  }
}
