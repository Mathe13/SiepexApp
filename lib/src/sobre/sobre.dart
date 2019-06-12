import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SobrePage extends StatelessWidget {
  final Widget child;

  SobrePage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sobre o Siepex'),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img/arte_uergs/Background_App_Siepex.png'),
                    fit: BoxFit.fill)),
            child: ListView(
              children: <Widget>[
                Image.asset(
                  'assets/img/arte_uergs/Logo-Siepex-sobre.png',
                  fit: BoxFit.cover,
                  // width: 20,
                ),
                AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.dark,
                    child: ListTile(
                        title: Text(
                      "O que é o siepex:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ))),
                ListTile(
                    title: Text.rich(TextSpan(
                        text:
                            """O Siepex é um espaço de divulgação dos projetos de Iniciação Científica, de Iniciação Tecnológica e Inovação, de Ensino e de Extensão. Podem participar e apresentar suas produções os estudantes de graduação e de pós-graduação da Uergs e de outras instituições de Ensino Superior. """))),
              ],
            )));
  }
}

//  ListTile(
// title: Text.rich(TextSpan(
//     text:
//         """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."""))),
