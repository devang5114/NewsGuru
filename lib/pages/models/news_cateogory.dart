import 'news.dart';

class NewsCategory {
  final List<News> business;
  final List<News> entertainment;
  final List<News> general;
  final List<News> health;
  final List<News> science;
  final List<News> sports;
  final List<News> technology;

  NewsCategory(
      {required this.business,
      required this.entertainment,
      required this.general,
      required this.health,
      required this.science,
      required this.sports,
      required this.technology});
}
