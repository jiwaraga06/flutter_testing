import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/source/data/cubit/testing_cubit.dart';
import 'package:flutter_testing/source/data/network/network.dart';
import 'package:flutter_testing/source/data/repository/repository.dart';
import 'package:flutter_testing/source/router/string.dart';
import 'package:flutter_testing/source/screen/CheckPost/index.dart';
import 'package:flutter_testing/source/screen/Dashboard/index.dart';
import 'package:flutter_testing/source/screen/Login/index.dart';
import 'package:flutter_testing/source/screen/Register/index.dart';

class RouterNavigation {
  MyRepository? myRepository;

  RouterNavigation() {
    myRepository = MyRepository(myNetwork: MyNetwork());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TestingCubit(
              myRepository: myRepository,
            ),
            child: const Login(),
          ),
        );
      case REGISTER:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TestingCubit(
              myRepository: myRepository,
            ),
            child: const Register(),
          ),
        );
      case DASHBOARD:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TestingCubit(
              myRepository: myRepository,
            ),
            child: const Dashboard(),
          ),
        );
      case CHECK_POST:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TestingCubit(
              myRepository: myRepository,
            ),
            child: const CheckPost(),
          ),
        );

      default:
        return null;
    }
  }
}
