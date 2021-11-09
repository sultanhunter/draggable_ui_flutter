import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drag_drop_state.dart';

class DragDropCubit extends Cubit<DragDropState> {
  DragDropCubit() : super(DragDropInitial());

  void circleSelected() => emit(const DragDropCircleSelected());

  void squircleSelected() => emit(const DragDropSquircleSelected());

  void reset() => emit(DragDropInitial());
}
