
import 'package:dailycricket_nv/screens/home/data_models/editors_pick_model.dart';
import 'package:dailycricket_nv/screens/home/network/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'editors_pick_event.dart';
import 'editors_pick_state.dart';

class EditorsPickBloc extends Bloc<EditorsPickEvent, EditorsPickState> {

  HomeRepository repository;

  EditorsPickBloc({required this.repository}) : super(EditorsPickInitial(),);

  @override
  Stream<EditorsPickState> mapEventToState(EditorsPickEvent event) async* {
    final currentState = state;

    if (event is EditorPickEvent) {

      if(currentState is EditorsPickInitial) {
        yield EditorsPickLoading();
        repository = HomeRepository();

        //-----------api is called-------------

        final response = await repository.getEditorsPickData();

        if (response.statusCode == 200) {

          EditorsPickModel editorsPickModel = EditorsPickModel.fromJson(response.data);

          yield EditorsPickSuccess(editorsPickModel: editorsPickModel);
        } else {
          yield EditorsPickFailure(errorMessage: 'Failed to fetch data');
        }
      }

    }

  }
}
