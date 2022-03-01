
import 'package:dailycricket_nv/screens/match_details/model/match_details_live_model.dart';
import 'package:dailycricket_nv/screens/match_details/model/over_wise_commentary.dart';
import 'package:dailycricket_nv/screens/match_details/network/match_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'match_details_event.dart';
import 'match_details_state.dart';


class MatchDetailsBloc extends Bloc<MatchDetailsEvent, MatchDetailsState> {

  MatchDetailsRepository repository;

  MatchDetailsBloc({required this.repository}) : super(MatchDetailsInitial(),);

  @override
  Stream<MatchDetailsState> mapEventToState(MatchDetailsEvent event) async* {
    final currentState = state;

    if (event is MatchDetailsDataEvent) {

      if(currentState is MatchDetailsInitial || currentState is MatchDetailsSuccess) {
        yield MatchDetailsLoading();
        repository = MatchDetailsRepository();

        //-----------api is called-------------

        final response = await repository.getMatchDetailsLiveData(event.matchId);

        if (response.statusCode == 200) {

          MatchDetailsLiveModel matchDetailsLiveModel = MatchDetailsLiveModel.fromJson(response.data);

          List<OverWiseCommentary> overWiseCommentary = [];
          List<Commentary> oneOverCommentary = [];
          List<BowlersDetails> bowlers = [];
          List<BatsmanDetails> batsman = [];

          matchDetailsLiveModel.response!.commentaries!.forEach((element) {
            if(element.event == Event.OVEREND){

              element.bowls!.forEach((element) {

                matchDetailsLiveModel.response!.players!.forEach((iterator) {
                  if(iterator.pid == element.bowlerId){
                    bowlers.add(BowlersDetails(runs: element.runsConceded!, bowlerName: iterator.title!, maidens: element.maidens!, overs: element.overs!, wickets: element.wickets!));
                  }
                  else{

                  }
                });

              });

              element.bats!.forEach((element) {

                matchDetailsLiveModel.response!.players!.forEach((iterator) {
                  if(iterator.pid == element.batsmanId){
                    batsman.add(BatsmanDetails(runs: element.runs!, ballFaced: element.ballsFaced!, batsmanName: iterator.title!));
                  }
                });

              });



              overWiseCommentary.add(OverWiseCommentary(oneOverCommentary: oneOverCommentary, batsman: batsman, bowlers: bowlers, commentary: element.commentary!),);

              print(oneOverCommentary);
              print(batsman);
              print(bowlers);
              oneOverCommentary = [];
              batsman = [];
              bowlers = [];


            }
            else {
              oneOverCommentary.add(element);
            }
          });

          yield MatchDetailsSuccess(overWiseCommentary: overWiseCommentary, runRate: matchDetailsLiveModel.response!.liveScore!.runrate!.toString(),);
        } else {
          yield MatchDetailsFailure(errorMessage: 'Failed to fetch data');
        }
      }

    }

  }
}
