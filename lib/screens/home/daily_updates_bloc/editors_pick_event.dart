import 'package:flutter/cupertino.dart';

@immutable
abstract class EditorsPickEvent {
  EditorsPickEvent();

  List<Object> get props => [];
}

//----------------data event with current index------------

class EditorPickEvent extends EditorsPickEvent {

  @override
  List<Object> get props => [];
}
