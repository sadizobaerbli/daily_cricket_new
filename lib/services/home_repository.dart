import '../../config/app_urls.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  Dio dio = Dio();

  ///This section refers a api call
  ///+ get request
  ///+ will get match's Live section data
  Future<Response?> getLiveMatchesData() async {
    try {
      final response = await dio.get(
        "$liveMatchesUrl",
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
  ///+ will get featured videos data
  Future<Response?> getFeaturedVideosData() async {
    try {
      final response = await dio.get(
        "$featuredVideosUrl",
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
  ///+ will get editors pick data
  Future<Response?> getEditorsPickData() async {
    try {
      final response = await dio.get(
        "$editorsPickUrl",
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
