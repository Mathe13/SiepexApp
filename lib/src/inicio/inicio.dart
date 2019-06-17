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
          elevation: 10,
          title: Text('Inicio'),
        ),
        drawer: HomeParticipante(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img/arte_uergs/Background_App_Siepex.png'),
                    fit: BoxFit.cover)),
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
                        context,
                        expanded: false),
                    itemButton(
                        new GridItem('Sobre o Siepex', 'sobre', Icons.info),
                        context,
                        expanded: false),
                    // itemButton(
                    //     new GridItem(
                    //         'Apresentado
                    itemButton(
                        new GridItem(
                          'Avisos',
                          'avisos',
                          Icons.warning,
                        ),
                        context,
                        expanded: false)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                Row(
                  children: <Widget>[
                    itemButton(
                        new GridItem('Hoteis', 'hoteis', Icons.map), context,
                        expanded: false),
                    itemButton(
                        new GridItem(
                            'Restaurantes', 'restaurantes', Icons.fastfood),
                        context,
                        expanded: false),
                    itemButton(
                        new GridItem(
                            'Informações úteis', 'info', Icons.new_releases),
                        context,
                        expanded: false)
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
                        context,
                        expanded: false),
                    itemButton(
                        new GridItem('Área do Participante', 'homeParticipante',
                            Icons.assignment_ind),
                        context,
                        expanded: false),
                    itemButton(
                        new GridItem(
                            'Mapa do evento', 'MapaEvento', Mdi.map_marker),
                        context,
                        expanded: false)
                  ],
                )
              ],
            )));
  }
}
