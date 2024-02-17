import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  const NewsEntity(
      {required this.author,
      required this.description,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.content});

  @override
  List<Object?> get props => [author, title, description, url, urlToImage];
}
