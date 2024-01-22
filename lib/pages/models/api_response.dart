import 'news.dart';

class ApiResponse {
  final News? news;
  final List<News>? newsList;
  final String? error;

  ApiResponse({this.news, this.newsList, this.error});
}
