import 'package:dailycricket_nv/config/app_urls.dart';
import 'package:dio/dio.dart';

class HomeRepository {

  Dio dio = Dio();

  //-------------------api function--------------------

  Future getLiveMatchesData() async {

    final response = await dio.get(
      "$liveMatchesUrl",
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

  Future getFeaturedVideosData() async {

    final response = await dio.get(
      "$featuredVideosUrl",
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

  Future getEditorsPickData() async {

    final response = await dio.get(
      "$editorsPickUrl",
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
