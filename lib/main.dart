import 'package:flutter/material.dart';
import 'package:thanesrobot/bloc/navigate/navigate_bloc.dart';
import 'package:thanesrobot/bloc/timer/timer_bloc.dart';
import 'package:thanesrobot/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final timerBloc = BlocProvider(create: (context) => TimerBloc());
    final navigateBloc = BlocProvider(create: (context) => NavigateBloc());
    return MultiBlocProvider(
      providers: [timerBloc, navigateBloc],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Thanes Robot',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const HomePage(),
      ),
    );
  }
}
