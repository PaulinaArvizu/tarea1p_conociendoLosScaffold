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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Click the FAB'),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              setState(() {
                _colored = !_colored;
                _clicks++;
              });
            },
            color: _colored ? Colors.yellow : Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
