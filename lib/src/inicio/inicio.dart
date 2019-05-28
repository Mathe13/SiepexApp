import 'package:flutter/material.dart';
import 'package:siepex/src/areaParticipante/homeParticipante.dart';
import 'package:siepex/src/inicio/itemButton.dart';
import 'package:siepex/mdi.dart';

class InicioPage extends StatelessWidget {
  final Widget child;

  InicioPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return corpo(context);
  }

  Widget corpo(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
        ),
        drawer: HomeParticipante(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img/arte_uergs/Background_App_Siepex.png'),
                    fit: BoxFit.fill)),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Image.asset(
                      'assets/img/arte_uergs/imagem-cabecalho-uergs-siepex-inove.png'),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                Row(
                  children: <Widget>[
                    itemButton(
                        new GridItem(
                            'Programação', 'eventos', Icons.calendar_today),
                        context),
                    itemButton(
                        new GridItem('Sobre o Siepex', 'sobre', Icons.info),
                        context),
                    itemButton(
                        new GridItem('Apresentadores de Trabalhos',
                            'palestrantes', Icons.group),
                        context)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                Row(
                  children: <Widget>[
                    itemButton(
                        new GridItem('Hoteis', 'hoteis', Icons.map), context),
                    itemButton(
                        new GridItem(
                            'Restaurantes', 'restaurantes', Icons.fastfood),
                        context),
                    itemButton(
                        new GridItem(
                            'Informações úteis', 'info', Icons.warning),
                        context)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                Row(
                  children: <Widget>[
                    itemButton(
                        new GridItem('Comissão Organizadora', '404',
                            Icons.business_center),
                        context),
                    itemButton(
                        new GridItem('Área do Participante', 'homeParticipante',
                            Icons.assignment_ind),
                        context),
                    itemButton(
                        new GridItem('Mapa do evento', '404', Mdi.map_marker),
                        context)
                  ],
                )
              ],
            )));
  }
}
