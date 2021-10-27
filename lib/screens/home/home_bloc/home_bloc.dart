
import 'package:dailycricket_nv/screens/home/data_models/live_matches_data_model.dart';
import 'package:dailycricket_nv/screens/home/network/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final currentState = state;

    if (event is LiveMatchesEvent) {

      if(currentState is HomeInitial) {
        yield HomeLoading();
        repository = HomeRepository();

        //-----------api is called-------------

        final response = await repository.getLiveMatchesData();

        if (response.statusCode == 200) {

          LiveMatchesDataModel liveMatchesDataModel = LiveMatchesDataModel.fromJson(response.data);

          yield HomeSuccess(liveMatchesDataModel: liveMatchesDataModel);
        } else {
          yield HomeFailure(errorMessage: 'Failed to fetch data');
        }
      }

    }

  }
}
