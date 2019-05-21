import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

class HomeParticipante extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeParticipanteState();
  }
}

class HomeParticipanteState extends State<HomeParticipante>
    with TickerProviderStateMixin {
  String nome = "nome";
  String email = "email@email.com";

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
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(nome),
            accountEmail: Text(email),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'https://avatars0.githubusercontent.com/u/29609021?s=400&u=be91d738c1796c1f523b5c630c1359956d170ccb&v=4'),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green[300], Colors.blueGrey.shade300])),
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
                              item('Escanear Presença', 'qr',
                                  Icons.camera_enhance),
                              item(
                                  'Alimentação', 'alimentacao', Icons.fastfood),
                              item('Minha Agenda', '', Icons.calendar_today),
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
                              ListTile(
                                leading:
                                    Icon(Icons.edit, color: Colors.green[300]),
                                title: Text('Editar Perfil'),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.red,
                                ),
                                title: Text(
                                  'Sair',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
