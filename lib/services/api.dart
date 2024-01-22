import 'package:dio/dio.dart';
import 'package:flutter_application_1/comman/constant/api_constant.dart';
import 'package:flutter_application_1/models/api_response.dart';

import '../models/news.dart';

// void main() async {
//   NewsApi newsApi = NewsApi();
//   final result = await newsApi.fetchNews;
//   if (result.newsList != null) {
//     print(result.newsList);
//   } else {
//     print(result.error);
//   }
// }

class NewsApi {
  late Dio dio;
  NewsApi() {
    dio = Dio();
  }

  Future<ApiResponse> get fetchTopHeadlinesNews async {
    try {
      Response response = await dio.get('$baseUrl$topHeadLinesendPoint',
          queryParameters: {"country": "in", "pageSize": 20},
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data['articles'];
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(responseData);

        final newsList = data.map((json) => News.fromJson(json: json)).toList();
        return ApiResponse(newsList: newsList);
      } else {
        return ApiResponse(error: "Somthing went wrong");
      }
    } catch (e) {
      return ApiResponse(error: e.toString());
    }
  }

  Future<List<News>> fetchHeadlinesNews(String category) async {
    try {
      Response response = await dio.get('$baseUrl$topHeadLinesendPoint',
          queryParameters: queryParams(category),
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data['articles'];
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(responseData);
        final newsList = data
            .map((json) => News.fromJson(json: json, type: category))
            .toList();
        return newsList;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> get fetchNews async {
    try {
      Response response = await dio.get('$baseUrl$searchendPoint',
          queryParameters: {"q": "india"}, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data['articles'];
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(responseData);
        final newsList = data.map((json) => News.fromJson(json: json)).toList();
        return ApiResponse(newsList: newsList);
      } else {
        return ApiResponse(error: "Somthing went wrong");
      }
    } catch (e) {
      return ApiResponse(error: e.toString());
    }
  }

  Future<ApiResponse> searchNews(String source) async {
    try {
      Response response = await dio.get('$baseUrl$searchendPoint',
          queryParameters: {"q": source, "pageSize": 20, "language": "en"},
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data['articles'];
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(responseData);
        final newsList = data.map((json) => News.fromJson(json: json)).toList();
        return ApiResponse(newsList: newsList);
      } else {
        return ApiResponse(error: "Somthing went wrong");
      }
    } catch (e) {
      return ApiResponse(error: e.toString());
    }
  }
}
