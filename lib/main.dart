import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _colored = false;
  int _clicks = 0;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Click the FAB'),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              setState(() {
                _colored = !_colored;
                _clicks++;
                if (_clicks % 2 == 0) {
                  //snackbar sin accion
                  _scaffoldKey.currentState
                    ..hideCurrentSnackBar() //ocultar snackbar anterior
                    ..showSnackBar(
                      //muestra snackbar
                      SnackBar(
                        content: Text("Número par. Snackbar sin accion."),
                        duration: Duration(milliseconds: 2000),
                      ),
                    );
                } else {
                  //snackbar con accion
                  _scaffoldKey.currentState
                    ..hideCurrentSnackBar() //ocultar snackbar anterior
                    ..showSnackBar(
                      //muestra snackbar
                      SnackBar(
                        content: Text("Número impar. Snackbar con accion."),
                        duration: Duration(milliseconds: 2000),
                        action: SnackBarAction(
                          label: 'Mostrar fecha',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text("Fecha"),
                                  content: Text(new DateTime.now().toString()),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Aceptar"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                }
              });
            },
            color: _colored ? Colors.yellow : Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Numero de clicks: $_clicks',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
