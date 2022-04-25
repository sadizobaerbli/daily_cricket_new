import 'package:dailycricket_nv/models/match_details_live_model.dart';
import 'package:dailycricket_nv/models/over_wise_commentary.dart';
import 'package:dailycricket_nv/models/scoreboard_model.dart';
import 'package:dailycricket_nv/services/match_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'match_details_event.dart';
import 'match_details_state.dart';


class MatchDetailsBloc extends Bloc<MatchDetailsEvent, MatchDetailsState> {

  MatchDetailsRepository repository;

  MatchDetailsBloc({required this.repository}) : super(MatchDetailsInitial(),);

  @override
  Stream<MatchDetailsState> mapEventToState(MatchDetailsEvent event) async* {
    final currentState = state;

    if (event is MatchDetailsLiveEvent) {

      if(currentState is MatchDetailsInitial || currentState is MatchDetailsLive || currentState is MatchDetailsScoreboard) {
        yield MatchDetailsLoading();
        repository = MatchDetailsRepository();

        //-----------api is called-------------

        final response = await repository.getMatchDetailsLiveData(event.matchId);

        if (response!.statusCode == 200) {

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

          yield MatchDetailsLive(overWiseCommentary: overWiseCommentary, runRate: matchDetailsLiveModel.response!.liveScore!.runrate!.toString(),);
        } else {
          yield MatchDetailsFailure(errorMessage: 'Failed to fetch data');
        }
      }

    }

    if (event is MatchDetailsScoreboardEvent) {

      if(currentState is MatchDetailsInitial || currentState is MatchDetailsLive || currentState is MatchDetailsScoreboard) {
        yield MatchDetailsLoading();
        repository = MatchDetailsRepository();

        //-----------api is called-------------

        final response = await repository.getMatchDetailsScoreboardData(event.matchId);

        if (response!.statusCode == 200) {

          MatchDetailsScoreboardModel matchDetailsScoreboardModel = MatchDetailsScoreboardModel.fromJson(response.data);

          yield MatchDetailsScoreboard(matchDetailsScoreboardModel: matchDetailsScoreboardModel);
        } else {
          yield MatchDetailsFailure(errorMessage: 'Failed to fetch data');
        }
      }

    }

  }
}
