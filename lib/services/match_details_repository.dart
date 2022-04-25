import '../../config/app_urls.dart';
import 'package:dio/dio.dart';

class MatchDetailsRepository {
  Dio dio = Dio();

  ///This section refers a api call
  ///+ get request
  ///+ will get match details Live section data
  Future<Response?> getMatchDetailsLiveData(int matchId) async {
    try {
      final response = await dio.get(
        matchDetailsLiveUrl(matchId),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Vary': 'Accept',
          },
          followRedirects: false,
        ),
      );
      return response;
    } catch (e) {
      if (e is DioError) {
        print(e);
      } else {
        rethrow;
      }
    }
  }

  ///This section refers a api call
  ///+ get request
  ///+ will get match details scoreboard section data
  Future<Response?> getMatchDetailsScoreboardData(int matchId) async {
    try {
      final response = await dio.get(
        matchDetailsScoreboardUrl(matchId),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Vary': 'Accept',
          },
          followRedirects: false,
        ),
      );
      return response;
    } catch (e) {
      if (e is DioError) {
        print(e);
      } else {
        rethrow;
      }
    }
  }
}
