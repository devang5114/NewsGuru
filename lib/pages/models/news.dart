// class News {
//   final String? type;
//   final String title;
//   final String desc;
//   final String authName;
//   final String imgUrl;
//   final String publishDate;

//   News(
//       {this.type,
//       required this.title,
//       required this.desc,
//       required this.authName,
//       required this.imgUrl,
//       required this.publishDate});

//   factory News.fromJson(Map<String, dynamic> json, String? type) {
//     return News(
//         type: type,
//         title: json['title'],
//         desc: json['desc'],
//         authName: json['authName'],
//         imgUrl: json['imgUrl'],
//         publishDate: json['publishDate']);
//   }
// }

class News {
  final String? type;
  final String source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  News(
      {this.type,
      required this.title,
      required this.description,
      required this.source,
      required this.author,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory News.fromJson({required Map<String, dynamic> json, String? type}) {
    return News(
        type: type,
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        source: json['source']['name'] ?? '',
        author: json['author'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ??
            'https://image.winudf.com/v2/image1/bmV1c2d1cnUuYXBwdGRmX3NjcmVlbl8wXzE1OTI4ODE0ODRfMDYw/screen-0.jpg?fakeurl=1&type=.jpg',
        publishedAt: json['publishedAt'] ?? '',
        content: json['content'] ?? '');
  }
}
