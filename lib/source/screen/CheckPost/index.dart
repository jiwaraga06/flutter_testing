import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/source/data/cubit/testing_cubit.dart';

class CheckPost extends StatefulWidget {
  const CheckPost({Key? key}) : super(key: key);

  @override
  State<CheckPost> createState() => _CheckPostState();
}

class _CheckPostState extends State<CheckPost> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Post'),
      ),
      body: BlocListener<TestingCubit, TestingState>(
        listener: (context, state) {
          if (state is CheckPostSuccess) {
            Navigator.pop(context);
          }
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Masukan tes",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Simpan'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
