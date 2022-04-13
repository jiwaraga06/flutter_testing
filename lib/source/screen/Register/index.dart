import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/source/data/cubit/testing_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_testing/source/data/network/api.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  var message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: BlocListener<TestingCubit, TestingState>(
        listener: (context, state) {
          if (state is RegisterMessage) {
            setState(() {
              message = state.message;
            });
          }
          if (state is RegisterError) {
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    )
                  ],
                );
              },
            );
          }
          if (state is RegisterSuccess) {
            Navigator.pop(context);
          }
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        hintText: "Please insert email",
                      )),
                  const SizedBox(height: 8.0),
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
                        BlocProvider.of<TestingCubit>(context).register(controllerEmail.text, controllerUsername.text, controllerPassword.text);
                        // register();
                      },
                      child: Text('Register'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
