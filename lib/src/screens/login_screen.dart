import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Bloc>(context);
    return Center(
        child: Column(children: <Widget>[
      SizedBox(height: 40.0),
      emailField(bloc),
      SizedBox(height: 20.0),
      passwordField(bloc),
      SizedBox(height: 20.0),
      submitButton(bloc)
    ]));
  }

  Widget emailField(Bloc bloc) => StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) => SizedBox(
          width: 350,
          child: TextField(
              onChanged: bloc.changeEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'you@shit.com',
                  labelText: 'Email',
                  errorText: snapshot.error))));

  Widget passwordField(Bloc bloc) => StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) => SizedBox(
          width: 350,
          child: TextField(
              obscureText: true,
              onChanged: bloc.changePassword,
              decoration: InputDecoration(
                  labelText: 'Password', errorText: snapshot.error))));

  Widget submitButton(Bloc bloc) => StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) => SizedBox(
          width: 300,
          height: 40,
          child: RaisedButton(
              onPressed: snapshot.hasData ? bloc.submit : null,
              child: Text('Login',
                  style: TextStyle(
                      fontFamily: 'modak',
                      fontSize: 26,
                      color: Colors.indigoAccent)))));
}
