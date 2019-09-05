import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:siepex/models/minicurso.dart';
import 'package:siepex/models/participante.dart';
import 'package:http/http.dart' as http;
import 'package:siepex/src/config.dart';

class MinicursoDetalhes extends StatelessWidget {
  final Minicurso minicurso;
  final bool cadastro;
  const MinicursoDetalhes({Key key, this.minicurso, this.cadastro = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${minicurso.titulo}"),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/img/arte_uergs/Background_App_Siepex.png'),
                  fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              //  AssetImage('assets/img/Untitled.png')
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                        height: 150,
                        width: double.infinity,
                        child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/img/Untitled.png'))),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 50,
                        // margin: EdgeInsets.only(right: 20),
                        child: Container(
                          child: Opacity(
                              opacity: 0.7,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.black,
                                child: Text(
                                  minicurso.titulo,
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontSize: 35,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      title: Text(
                        "Palestrante",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        minicurso.palestrante,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        "Horário",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "${minicurso.inicio}-${minicurso.fim}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        "Vagas",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "${minicurso.vagas}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        "Local",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Sala ${minicurso.sala} no prédio ${minicurso.predio}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    minicurso.obs != null && minicurso.obs != ''
                        ? ListTile(
                            dense: true,
                            title: Text(
                              "Observação",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              "${minicurso.obs}",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        : Container(),
                    cadastro
                        ? ListTile(
                            title: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Color(0xff2595A6),
                              onPressed: () {
                                Participante.getStorage().then((participante) {
                                  if (participante == false) {
                                    Alert(
                                      context: context,
                                      type: AlertType.warning,
                                      title: "Aviso",
                                      desc:
                                          "É preciso fazer login para prosseguir",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Ok",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                                context, "login");
                                          },
                                          width: 120,
                                        )
                                      ],
                                    ).show();
                                    return;
                                  }
                                  http.put(
                                      baseUrl +
                                          "minicursos/${minicurso.id}/cadastrar",
                                      body: {
                                        "id_participante": participante.id
                                      }).then((respostaRaw) {
                                    var resposta = jsonDecode(respostaRaw.body);
                                    if (resposta['status'] == "sucesso") {
                                      Alert(
                                        context: context,
                                        type: AlertType.success,
                                        title: "Sucesso",
                                        desc: "Cadastrado com sucesso",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Ok",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    } else if (resposta['status'] != null) {
                                      Alert(
                                        context: context,
                                        type: AlertType.warning,
                                        title: "Falha",
                                        desc: resposta['status'],
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Ok",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                  });
                                }).catchError((onError) {
                                  print(onError);
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "Erro",
                                    desc: "Estamos com problemas tecnicos",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                      )
                                    ],
                                  ).show();
                                });
                              },
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        : ListTile(
                            title: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Color(0xff2595A6),
                              onPressed: () {
                                Participante.getStorage().then((participante) {
                                  http
                                      .delete(baseUrl +
                                          "minicursos/${minicurso.id}/liberar/${participante.id}")
                                      .then((respostaRaw) {
                                    var resposta = jsonDecode(respostaRaw.body);
                                    if (resposta['status'] == "sucesso") {
                                      Alert(
                                        context: context,
                                        type: AlertType.success,
                                        title: "Sucesso",
                                        desc: "Liberado com sucesso",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Ok",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.warning,
                                        title: "Sucesso",
                                        desc: "Liberado",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Ok",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                  });
                                }).catchError((onError) {
                                  print(onError);
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "Erro",
                                    desc: "Estamos com problemas tecnicos",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                      )
                                    ],
                                  ).show();
                                });
                              },
                              child: Text(
                                "Liberar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget palestranteCard(String nome, BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Color(0xff2595A6),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                            // margin: EdgeInsets.only(left: 20, right: 10, top: 15),
                            width: 70,
                            height: 70,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new NetworkImage(
                                        "https://avatars1.githubusercontent.com/u/29609021?s=400&u=24a2c965697b52e2697feb03ec808aa9b1b32443&v=4")))),
                        // Text(
                        //   'Autor da palestra',
                        //   textAlign: TextAlign.center,
                        // )
                      ],
                    )),
                Expanded(
                  flex: 3,
                  child: Container(
                      margin: EdgeInsets.only(top: 0),
                      child: ListTile(
                        title: Text(nome),
                        // subtitle: Text('n palestras'),
                      )),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ));
  }
}
