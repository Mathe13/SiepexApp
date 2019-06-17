import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AvisosPage extends StatelessWidget {
  final Widget child;

  AvisosPage({Key key, this.child}) : super(key: key);

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
                        "Alojamento:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle:
                          Text("""O alojamento esse ano fica no centro vida, 
Endereço:Av Baltazar de Oliveira Garcia, 2132, Bairro Sarandi, Porto Alegre, Rio Grande do Sul
Telefone:(51) 3348.2051"""),
                    )),
                AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.dark,
                    child: ListTile(
                      title: Text(
                        "Bebidas:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                          """É proibido o uso de bebidas alcoólicas dentro do evento"""),
                    )),
                AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.dark,
                    child: ListTile(
                      title: Text(
                        "Barulho:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle:
                          Text("""É proibido som alto após as 21 horas"""),
                    )),
                // ListTile(
                //     title: Text.rich(TextSpan(
                //         text:
                //             """O alojamento esse ano fica no centro vida """))),
              ],
            )));
  }
}
