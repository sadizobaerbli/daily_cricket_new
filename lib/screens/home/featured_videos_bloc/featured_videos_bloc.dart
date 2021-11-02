
import 'package:dailycricket_nv/screens/home/data_models/featured_videos_model.dart';
import 'package:dailycricket_nv/screens/home/network/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featured_videos_event.dart';
import 'featured_videos_state.dart';

class FeaturedVideosBloc extends Bloc<FeaturedVideosEvent, FeaturedVideosState> {

  HomeRepository repository;

  FeaturedVideosBloc({required this.repository}) : super(FeaturedVideosInitial(),);

  @override
  Stream<FeaturedVideosState> mapEventToState(FeaturedVideosEvent event) async* {
    final currentState = state;

    if (event is FeaturedVideoEvent) {

      if(currentState is FeaturedVideosInitial) {
        yield FeaturedVideosLoading();
        repository = HomeRepository();

        //-----------api is called-------------

        final response = await repository.getFeaturedVideosData();

        if (response.statusCode == 200) {

          FeaturedVideosModel featuredVideosModel = FeaturedVideosModel.fromJson(response.data);

          yield FeaturedVideosSuccess(featuredVideosModel: featuredVideosModel);
        } else {
          yield FeaturedVideosFailure(errorMessage: 'Failed to fetch data');
        }
      }

    }

  }
}
