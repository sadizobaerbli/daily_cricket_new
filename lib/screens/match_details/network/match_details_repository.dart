import 'package:dailycricket_nv/config/app_urls.dart';
import 'package:dio/dio.dart';

class MatchDetailsRepository {

  Dio dio = Dio();

  //-------------------api function--------------------

  Future getMatchDetailsLiveData(int matchId) async {

    final response = await dio.get(
      matchDetailsLiveUrl(matchId),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Vary': 'Accept',
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    return response;
  }

  Future getMatchDetailsScoreboardData(int matchId) async {

    final response = await dio.get(
      matchDetailsScoreboardUrl(matchId),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Vary': 'Accept',
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    return response;
  }

}
