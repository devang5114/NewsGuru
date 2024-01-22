const apiKey = "fcb249851950439c9bf96be372a2fddc";
const baseUrl = "https://newsapi.org/v2";
const topHeadLinesendPoint = "/top-headlines";
const searchendPoint = "/everything";

Map<String, dynamic> headers = {
  'X-Api-Key': apiKey,
};

Map<String, dynamic> queryParams(String cat) {
  Map<String, dynamic> queryParameters = {
    "country": "in",
    "category": cat,
    "pageSize": 20
  };
  return queryParameters;
}

class Category {
  static const business = "business";
  static const entertainment = "entertainment";
  static const general = "general";
  static const health = "health";
  static const science = "science";
  static const sports = "sports";
  static const technology = "technology";
}
