import 'package:rxdart/rxdart.dart';
import 'validators.dart';
// import 'dart:async';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // adds data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  // change the data on stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // submit data
  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print('Email is: $validEmail');
    print('Password is: $validPassword');
  }

  // dispose of the stream controllers
  dispose() {
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();
