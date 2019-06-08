import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siepex/models/minicurso.dart';
import 'package:siepex/models/palestrante.dart';

class MinicursoDetalhes extends StatelessWidget {
  final Minicurso minicurso;
  const MinicursoDetalhes({Key key, this.minicurso}) : super(key: key);

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
                    ListTile(
                      title: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Color(0xff2595A6),
                        onPressed: () {
                          // validaCampos();
                        },
                        child: Text(
                          "Cadastrar",
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
                                        "https://avatars0.githubusercontent.com/u/29609021?s=400&u=be91d738c1796c1f523b5c630c1359956d170ccb&v=4")))),
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
