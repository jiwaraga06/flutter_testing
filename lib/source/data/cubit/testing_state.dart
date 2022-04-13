part of 'testing_cubit.dart';

@immutable
abstract class TestingState {}

class TestingInitial extends TestingState {}

class LoginLoading extends TestingState {}

class LoginLoaded extends TestingState {}

class LoginError extends TestingState {}

class LoginSuccess extends TestingState {}

class LoginMessage extends TestingState {
  final String? message;

  LoginMessage({this.message});
}

class RegisterLoading extends TestingState {}

class RegisterLoaded extends TestingState {}

class RegisterError extends TestingState {}

class RegisterSuccess extends TestingState {}

class RegisterMessage extends TestingState {
  final String? message;

  RegisterMessage({this.message});
}

class CheckLoading extends TestingState {}

class CheckLoaded extends TestingState {
  final List<MyModel>? model;

  CheckLoaded({this.model});
}

class CheckSuccess extends TestingState {}

class CheckError extends TestingState {}

class CheckMessage extends TestingState {
  final String? message;

  CheckMessage({this.message});
}
class CheckPostLoading extends TestingState {}

class CheckPostLoaded extends TestingState {}

class CheckPostSuccess extends TestingState {}

class CheckPostError extends TestingState {}

class CheckPostMessage extends TestingState {
  final String? message;

  CheckPostMessage({this.message});
}
