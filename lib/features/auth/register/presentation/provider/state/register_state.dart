import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final bool obscureForm;

  const RegisterState({this.obscureForm = true});

  RegisterState copyWith({bool? obscureForm}) =>
      RegisterState(obscureForm: obscureForm ?? this.obscureForm);
  @override
  List<Object?> get props => [obscureForm];
}
