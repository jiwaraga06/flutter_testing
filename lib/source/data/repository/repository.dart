import 'package:flutter_testing/source/data/network/network.dart';

class MyRepository {
  final MyNetwork? myNetwork;

  MyRepository({this.myNetwork});

  Future login(var username, var password) async {
    var data = {
      "username": username,
      "password": password,
    };
    print("data $data");
    final json = await myNetwork!.login(data);
    return json;
  }

  Future register(var email, var username, var password) async {
    var data = {
      "email": email,
      "username": username,
      "password": password,
    };
    print("data $data");
    final json = await myNetwork!.register(data);
    return json;
  }

  Future checklist() async {
    final json = await myNetwork!.checklist();
    return json;
  }

  Future checklistPost(name) async {
    var data = {
      "name": name,
    };
    final json = await myNetwork!.checklistPost(data);
    return json;
  }
}
