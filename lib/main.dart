import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'src/screens/login_screen.dart';
import 'src/blocs/bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider(
      create: (context) => Bloc(),
      dispose: (context, bloc) => bloc.dispose(),
      child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                  title: Text('Fortress',
                      style: TextStyle(
                          fontFamily: 'modak',
                          fontSize: 30,
                          color: Colors.indigoAccent)),
                  centerTitle: false,
                  backgroundColor: Colors.grey[300]),
              body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
                  ),
                  child: LoginScreen()))));
}
