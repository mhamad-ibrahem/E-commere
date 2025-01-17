import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool obscureForm;

  const LoginState({this.obscureForm = true});

  LoginState copyWith({bool? obscureForm}) =>
      LoginState(obscureForm: obscureForm ?? this.obscureForm);
  @override
  List<Object?> get props => [obscureForm];
}
