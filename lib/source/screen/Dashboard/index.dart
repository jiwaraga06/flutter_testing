import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/source/data/cubit/testing_cubit.dart';
import 'package:flutter_testing/source/data/network/api.dart';
import 'package:flutter_testing/source/router/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List data = [];

  void checklist() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      var url = Uri.parse(Api.checklist());
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
      });
      var json = jsonDecode(response.body);
      print(json);
      if (response.statusCode == 200) {
        setState(() {
          data = json['data'] as List;
        });
      }
    } catch (e) {
      // print('Error checklist :$e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checklist();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TestingCubit>(context).checklist();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: BlocBuilder<TestingCubit, TestingState>(builder: (context, state) {
        var data = (state as CheckLoaded).model;
        return ListView.builder(
          itemCount: data!.length,
          itemBuilder: (BuildContext context, int index) {
            var json = data[index];
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(json.name),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CHECK_POST);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
