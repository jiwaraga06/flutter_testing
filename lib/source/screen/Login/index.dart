import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/source/data/cubit/testing_cubit.dart';
import 'package:flutter_testing/source/data/network/api.dart';
import 'package:flutter_testing/source/router/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  var message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocListener<TestingCubit, TestingState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, DASHBOARD);
          }
          if (state is LoginMessage) {
            setState(() {
              message = state.message;
            });
          }
          if (state is LoginError) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alert'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(message.toString()),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: Text('OK'),
                    )
                  ],
                );
              },
            );
          }
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                      controller: controllerUsername,
                      decoration: InputDecoration(
                        hintText: "Please insert username",
                      )),
                  const SizedBox(height: 8.0),
                  TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Please insert password",
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<TestingCubit>(context).login(controllerUsername.text, controllerPassword.text);
                        // login();
                      },
                      child: Text('Login'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, REGISTER);
                      },
                      child: Text('Register'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
