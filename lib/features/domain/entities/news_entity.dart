import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  const NewsEntity(
      {required this.author,
      required this.description,
      required this.title,
      required this.url,
      required this.urlToImage});

  @override
  List<Object?> get props => [author, title, description, url, urlToImage];
}
