import 'dart:convert';

import 'package:flutter_testing/source/data/network/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyNetwork {
  Future login(data) async {
    try {
      var url = Uri.parse(Api.login());
      var response = await http.post(
        url,
        headers: {"Content-Type": 'application/json'},
        body: jsonEncode(data),
      );

      return response;
    } catch (e) {
      // print('Error login :$e');
    }
  }

  Future register(data) async {
    try {
      var url = Uri.parse(Api.register());
      var response = await http.post(
        url,
        headers: {"Content-Type": 'application/json'},
        body: jsonEncode(data),
      );
      return response;
    } catch (e) {
      print('Error register :$e');
    }
  }

  Future checklist() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      var url = Uri.parse(Api.checklist());
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
      });
      // final json = response;
      return response;
    } catch (e) {
      // print('Error checklist :$e');
    }
  }

  Future checklistPost(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      var url = Uri.parse(Api.checklist());
      var response = await http.post(url,
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data));
      // final json = response;
      return response;
    } catch (e) {
      // print('Error checklist :$e');
    }
  }
}
