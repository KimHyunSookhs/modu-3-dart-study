import 'dart:convert';

Future<Movie> getMovieInfo() async {
  final String jsonString = '''{
  "title" : "Star Wars",
  "director" : "George Lucas",
  "openYear" : 1977
  }''';

  try {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    final Movie movie = Movie.fromJson(json);
    return movie;
  } catch (e) {
    throw Exception('영화 정보를 파싱하는 중 오류가 발생했습니다');
  }
}

class Movie {
  final String title;
  final String director;
  final int openYear;

  Movie({required this.title, required this.director, required this.openYear});

  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'openYear': openYear};
  }

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      openYear = json['openYear'];
}
