import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:siepex/models/participante.dart';
import 'package:siepex/src/config.dart';
import 'package:siepex/src/inicio/inicio.dart';
import 'package:siepex/src/input.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

TextEditingController senha = TextEditingController();
TextEditingController senha2 = TextEditingController();
bool _errSenha2 = false, _errSenha = false;

class MudaSenhaPage extends StatelessWidget {
  const MudaSenhaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Siepex App 2019")],
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img/arte_uergs/Background_App_Siepex.png'),
                    fit: BoxFit.cover)),
            child: ListView(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Image.asset(
                    'assets/img/arte_uergs/imagem-cabecalho-uergs-siepex-inove.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Alteração de senha",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    Text(
                      "Insira sua nova senha nos campos abaixo",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    OutlineInput(
                      label: 'Digite a nova senha',
                      err: _errSenha2,
                      type: "senha",
                      // hint: 'a senha padrão é o seu cpf',
                      controller: senha2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    OutlineInput(
                      label: 'Confirme a nova senha',
                      err: _errSenha,
                      type: "senha",
                      // hint: 'a senha padrão é o seu cpf',
                      controller: senha,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 13.0),
                        child: Text(
                          "Mudar",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Color(0xff2595A6),
                        onPressed: () =>
                            {mudasenha(senha2.text, senha.text, context)},
                      ),
                    )
                  ],
                ),
              ),
            ])),
      ),
    );
  }

  mudasenha(String senha2, String senha, BuildContext context) async {
    Participante.getStorage().then((participante) async {
      if (participante == false) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "Aviso",
          desc: "É preciso fazer login para prosseguir",
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "login");
              },
              width: 120,
            )
          ],
        ).show();
        return;
      }
      if (senha != senha2) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "Aviso",
          desc: "Suas senhas não combinam",
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, "login");
              },
              width: 120,
            )
          ],
        ).show();
        return;
      }

      var resposta = jsonDecode((await http.put(
              baseUrl + "participante/" + participante.id,
              body: {"senha": senha}))
          .body);
      print(resposta);
      if (1 == null) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "Erro",
          desc: "Desculpe mas ocorreu um erro",
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, "login");
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Sucesso",
          desc: "Senha alterada",
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, "login");
              },
              width: 120,
            )
          ],
        ).show();
      }
    });
  }
}
