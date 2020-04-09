import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) => email.contains('@')
          ? sink.add(email)
          : sink.addError('valid email required'));
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (pass, sink) => pass.length < 6
          ? sink.addError('6 character minimum')
          : sink.add(pass));
}
