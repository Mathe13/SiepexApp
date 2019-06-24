import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:siepex/models/participante.dart';
import 'package:siepex/models/visitas.dart';
import 'package:siepex/src/config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class VisitasDetalhes extends StatelessWidget {
  final Visita visita;
  final bool cadastra;
  const VisitasDetalhes({
    Key key,
    this.visita,
    this.cadastra = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${visita.tblLocaisVisitas[0].local}"),
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
                                  visita.tblLocaisVisitas[0].local,
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
                        "Locais",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        // '',
                        visita.getListaLocais(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        "Saida-Retorno",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "${visita.saida}-${visita.retorno}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        "Distancia",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "${visita.km} km",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    contatos(visita.tblContatoVisitas),
                    cadastra
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
                                          "visitas/${visita.idVisitas}/cadastrar",
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
                                        desc: resposta['status'].toString(),
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
                                      .delete(
                                    baseUrl +
                                        "visitas/${visita.idVisitas}/liberar/${participante.id}",
                                  )
                                      .then((respostaRaw) {
                                    print(respostaRaw.body);
                                    var resposta = jsonDecode(respostaRaw.body);
                                    if (resposta['status'] == "sucesso") {
                                      Alert(
                                        context: context,
                                        type: AlertType.success,
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
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.warning,
                                        title: "Sucesso",
                                        desc: "Foi liberado",
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

  Widget contatos(List<TblContatoVisitas> contatos) {
    List<Widget> contatosLista = [];
    if (contatos == null || contatos.length == 0) {
      return Container();
    } else {
      contatosLista.add(
        ListTile(
          dense: true,
          title: Text(
            "Contato",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      );
      contatos.forEach((contato) {
        contatosLista.add(ListTile(
          title: Text(contato.nome),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              contato.telefone1 != ''
                  ? GestureDetector(
                      onTap: () async {
                        String url = "tel:${contato.telefone1}";
                        if (await canLaunch(url)) {
                          launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(contato.telefone1))
                  : Container(),
              contato.telefone2 != ''
                  ? GestureDetector(
                      onTap: () async {
                        String url = "tel:${contato.telefone2}";
                        if (await canLaunch(url)) {
                          launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(contato.telefone2))
                  : Container(),
              contato.email != ''
                  ? GestureDetector(
                      onTap: () async {
                        String url = "mailto:${contato.email}";
                        if (await canLaunch(url)) {
                          launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(contato.email))
                  : Container(),
            ],
          ),
        ));
      });
      contatosLista.add(Divider());
      return Column(children: contatosLista);
    }
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
                            width: 70,
                            height: 70,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new NetworkImage(
                                        "https://avatars1.githubusercontent.com/u/29609021?s=400&u=24a2c965697b52e2697feb03ec808aa9b1b32443&v=4")))),
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
