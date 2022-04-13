import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_testing/source/data/model/model.dart';
import 'package:flutter_testing/source/data/network/network.dart';
import 'package:flutter_testing/source/data/repository/repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'testing_state.dart';

class TestingCubit extends Cubit<TestingState> {
  final MyRepository? myRepository;

  TestingCubit({this.myRepository}) : super(TestingInitial());

  void login(var username, var password) async {
    emit(LoginLoading());
    myRepository!.login(username!, password!).then((value) async{
      // print(value);
      var json = jsonDecode(value.body);
      print('JSON LOGIN: $json');
      if (value.statusCode == 200) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('token',json['data']['token']);
        emit(LoginLoaded());
        emit(LoginSuccess());
        emit(LoginMessage(message: json['message']));
      } else {
        emit(LoginLoaded());
        emit(LoginError());
        emit(LoginMessage(message: json['message']));
      }
    });
  }

  void register(var email, var username, var password) async {
    emit(RegisterLoading());
    myRepository!.register(email, username, password).then((value) {
      // print(value);
      var json = jsonDecode(value.body);
      print('JSON REGISTER: $json');
      if (value.statusCode == 200) {
        emit(RegisterLoaded());
        emit(RegisterSuccess());
        emit(RegisterMessage(message: json['message']));
      } else {
        emit(RegisterLoaded());
        emit(RegisterError());
        emit(RegisterMessage(message: json['errorMessage']));
      }
    });
  }

  void checklist() async {
    myRepository!.checklist().then((value) async {
      var json = jsonDecode(value.body);
    print("value checklist $json");
      if (value.statusCode == 200) {
        emit(CheckLoaded(model: json['data']));
        json['data'].map((e) => MyModel.fromJson(e));
      } else {
        emit(CheckLoaded());
      }
    });
  }

  void checklistPost(name) async {
    emit(CheckPostLoading());
    myRepository!.checklistPost(name).then((value) async {
      var json = jsonDecode(value.body);
      if (value.statusCode == 200) {
        emit(CheckPostLoaded());
      } else {
        emit(CheckPostLoaded());
      }
    });
    print("value");
  }
}
