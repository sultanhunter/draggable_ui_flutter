part of 'drag_drop_cubit.dart';

abstract class DragDropState extends Equatable {
  const DragDropState();

  @override
  List<Object> get props => [];
}

class DragDropInitial extends DragDropState {}

class DragDropCircleSelected extends DragDropState {
  final String selected;

  const DragDropCircleSelected({this.selected = 'Circle Selected'});
}

class DragDropSquircleSelected extends DragDropState {
  final String selected;

  const DragDropSquircleSelected({this.selected = 'Squircle Selected'});
}
