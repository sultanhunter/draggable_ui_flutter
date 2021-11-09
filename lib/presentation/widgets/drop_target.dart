import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_taks_1/app/device.prop.dart';
import 'package:ui_taks_1/domain/cubit/cubit/drag_drop_cubit.dart';
import 'package:ui_taks_1/presentation/widgets/circle.dart';
import 'package:ui_taks_1/presentation/widgets/squircle.dart';

class DrTarget extends StatelessWidget {
  const DrTarget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DragDropCubit, DragDropState>(
      builder: (context, state) {
        return Container(
          height: width(context) * 0.40,
          width: width(context) * 0.40,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(
                width(context) * 0.08,
              ))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: state is DragDropCircleSelected
                  ? const Circle()
                  : state is DragDropSquircleSelected
                      ? const Squircle()
                      : const Text(
                          'DROP TARGET',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
            ),
          ),
        );
      },
    );
  }
}
