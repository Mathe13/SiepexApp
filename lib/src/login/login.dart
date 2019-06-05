import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:siepex/models/participante.dart';
import 'package:siepex/src/config.dart';
import 'package:siepex/src/inicio/inicio.dart';
import 'package:siepex/src/input.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

MaskedTextController cpf = MaskedTextController(mask: "000.000.000-00");
TextEditingController senha = TextEditingController();
bool _errCpf = false, _errSenha = false;

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

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
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    Text(
                      "Introduza seu número de celular e senha",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    OutlineInput(
                      label: 'Digite seu cpf',
                      cpfCnpj: true,
                      type: "numero",
                      err: _errCpf,
                      controller: cpf,
                      hint: 'Digite o cpf associado a sua conta',
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    OutlineInput(
                      label: 'Digite sua senha',
                      err: _errSenha,
                      type: "senha",
                      hint: 'a senha padrão é o seu cpf',
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
                          "ENTRAR",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Color(0xff2595A6),
                        onPressed: () => {logar(cpf.text, senha.text, context)},
                      ),
                    )
                  ],
                ),
              ),
            ])),
      ),
    );
  }

  logar(String cpf, String senha, BuildContext context) async {
    print("login");
    cpf = (cpf.replaceAll(".", "")).replaceAll("-", "");
    print(cpf);
    print(senha);

    try {
      var resposta = jsonDecode(
          (await http.get(baseUrl + 'participante/$cpf/login?senha=$senha'))
              .body);
      if (resposta['erro'] != null) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Erro",
          desc: resposta['erro'],
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      } else {
        var user = new Participante();
        user.fromJson(resposta);
        user.setStorage();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => InicioPage()),
          ModalRoute.withName('tabs'),
        );
      }
      // print(storage.getItem("user"));
    } catch (e) {
      print(e);
      Alert(context: context, title: "Erro", desc: "Falha no Login").show();
    }
  }
}
