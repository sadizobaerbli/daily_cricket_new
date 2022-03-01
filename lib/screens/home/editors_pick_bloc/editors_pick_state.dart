
import 'package:dailycricket_nv/screens/home/data_models/editors_pick_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class EditorsPickState {
  const EditorsPickState();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [];
}

class EditorsPickInitial extends EditorsPickState {}

class EditorsPickLoading extends EditorsPickState {
  @override
  List<Object> get props => [];
}

//------------------sucess state-----------------

class EditorsPickSuccess extends EditorsPickState {

  final EditorsPickModel editorsPickModel;
  EditorsPickSuccess({required this.editorsPickModel});

  @override
  List<Object> get props => [editorsPickModel];
}

//------------------failure state-----------------

class EditorsPickFailure extends EditorsPickState {
  final String errorMessage;
  const EditorsPickFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
