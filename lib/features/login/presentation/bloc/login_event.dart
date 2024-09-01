part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUserEvent extends LoginEvent{
  final bool isVerified;

  LoginUserEvent({
    required this.isVerified,
  });
}
