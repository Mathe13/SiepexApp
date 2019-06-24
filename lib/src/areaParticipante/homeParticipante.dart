import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:siepex/mdi.dart';
import 'package:siepex/models/participante.dart';
import 'package:siepex/src/login/login.dart';

class HomeParticipante extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeParticipanteState();
  }
}

class HomeParticipanteState extends State<HomeParticipante>
    with TickerProviderStateMixin {
  String nome = 'Convidado';
  String email = "Não logado";
  static final Animatable<Offset> _drawerDetailsTween = Tween<Offset>(
    begin: Offset(0.0, -1.0),
    end: Offset.zero,
  ).chain(CurveTween(
    curve: Curves.fastOutSlowIn,
  ));

  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;

  Widget textMenu(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
    );
  }

  @override
  void initState() {
    Participante.getStorage().then((user) {
      print(user);
      setState(() {
        nome = user.nome;
        email = user.email;
      });
    }).catchError((error) {
      print(error);
    });
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = _controller.drive(_drawerDetailsTween);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/img/arte_uergs/Background_App_Siepex.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(nome),
                accountEmail: Text(email),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      'https://avatars1.githubusercontent.com/u/29609021?s=400&u=24a2c965697b52e2697feb03ec808aa9b1b32443&v=4'),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff249FAB),
                  Color(0xff2E4D89),
                  Color(0xff704989),
                  Color(0xffEAA074)
                ])),
                margin: EdgeInsets.zero,
                onDetailsPressed: () {
                  _showDrawerContents = !_showDrawerContents;
                  if (_showDrawerContents)
                    _controller.reverse();
                  else
                    _controller.forward();
                },
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Expanded(
                  child: Container(
                      child: ListView(
                    dragStartBehavior: DragStartBehavior.down,
                    padding: EdgeInsets.only(top: 8.0),
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          FadeTransition(
                            opacity: _drawerContentsOpacity,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // item('Escanear Presença', 'qr',
                                  //     Icons.camera_enhance),
                                  // item('Alimentação', 'alimentacao',
                                  //     Icons.fastfood),
                                  item('Minha Agenda', 'meuseventos',
                                      Icons.calendar_today),
                                  item('Mudar Senha', 'mudasenha', Icons.lock),
                                ]),
                          ),
                          SlideTransition(
                            position: _drawerDetailsPosition,
                            child: FadeTransition(
                              opacity: ReverseAnimation(_drawerContentsOpacity),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  // ListTile(
                                  //   leading: Icon(Icons.edit,
                                  //       color: Colors.green[300]),
                                  //   title: Text('Editar Perfil'),
                                  //   onTap: () {},
                                  // ),
                                  nome == 'Convidado'
                                      ? ListTile(
                                          leading: Icon(
                                            Mdi.login,
                                            color: Colors.green,
                                          ),
                                          title: Text(
                                            'Login',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                          onTap: () async {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              ModalRoute.withName('tabs'),
                                            );
                                          },
                                        )
                                      : ListTile(
                                          leading: Icon(
                                            Icons.exit_to_app,
                                            color: Colors.red,
                                          ),
                                          title: Text(
                                            'Sair',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          onTap: () async {
                                            await Participante.logout();
                                            Navigator.pop(context);
                                          },
                                        )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ),
            ],
          )),
    );
  }

  Widget item(String title, String url, IconData icone) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icone,
            color: Colors.green[300],
          ),
          dense: true,
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.of(context).popAndPushNamed(url);
          },
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }
}
