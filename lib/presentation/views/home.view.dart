import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_taks_1/domain/cubit/cubit/drag_drop_cubit.dart';
import 'package:ui_taks_1/presentation/widgets/circle.dart';
import 'package:ui_taks_1/presentation/widgets/drop_target.dart';
import 'package:ui_taks_1/presentation/widgets/empty_circle.dart';
import 'package:ui_taks_1/presentation/widgets/empty_squircle.dart';
import 'package:ui_taks_1/presentation/widgets/squircle.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blue, Colors.pink],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<DragDropCubit, DragDropState>(
              builder: (context, state) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: state is DragDropCircleSelected
                        ? [
                            const EmptyCircle(),
                            const Draggable(
                              data: 'squircle',
                              child: Squircle(),
                              feedback: Squircle(),
                              childWhenDragging: EmptySquircle(),
                            ),
                          ]
                        : state is DragDropSquircleSelected
                            ? [
                                const Draggable(
                                  data: 'circle',
                                  child: Circle(),
                                  feedback: Circle(),
                                  childWhenDragging: EmptyCircle(),
                                ),
                                const EmptySquircle(),
                              ]
                            : [
                                const Draggable(
                                  data: 'circle',
                                  child: Circle(),
                                  feedback: Circle(),
                                  childWhenDragging: EmptyCircle(),
                                ),
                                const Draggable(
                                  data: 'squircle',
                                  child: Squircle(),
                                  feedback: Squircle(),
                                  childWhenDragging: EmptySquircle(),
                                ),
                              ]);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            DragTarget(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return const DrTarget();
              },
              onWillAccept: (data) {
                return data == 'circle' || data == 'squircle';
              },
              onAccept: (data) {
                if (data == 'circle') {
                  context.read<DragDropCubit>().circleSelected();
                }
                if (data == 'squircle') {
                  context.read<DragDropCubit>().squircleSelected();
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<DragDropCubit>().reset();
                },
                child: const Text('Reset')),
            BlocBuilder<DragDropCubit, DragDropState>(
                builder: (context, state) {
              return state is DragDropCircleSelected
                  ? Text(
                      state.selected,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  : state is DragDropSquircleSelected
                      ? Text(
                          state.selected,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'None Selected',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        );
            }),
          ],
        ),
      ),
    );
  }
}
