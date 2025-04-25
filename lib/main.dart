import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpenso/data/local/db_helper.dart';
import 'package:xpenso/data/repository/user_repository.dart';
import 'package:xpenso/ui/screen/bloc/expense_bloc.dart';
import 'package:xpenso/ui/screen/log_in/login/login_bloc.dart';
import 'package:xpenso/ui/screen/log_in/register/register_bloc.dart';
import 'package:xpenso/ui/screen/splash/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => RegisterBloc(
              userRepository:
                  UserRepository(dbHelper: DbHelper.getInstance()))),
      BlocProvider(
          create: (context) => LoginBloc(
              userRepository:
                  UserRepository(dbHelper: DbHelper.getInstance()))),
      BlocProvider(
          create: (context) => ExpenseBloc(
              dbHelper: DbHelper.getInstance())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: splashPage());
  }
}
