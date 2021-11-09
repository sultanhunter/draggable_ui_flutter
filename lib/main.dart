import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_taks_1/domain/cubit/cubit/drag_drop_cubit.dart';
import 'package:ui_taks_1/presentation/views/home.view.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DragDropCubit(),
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
