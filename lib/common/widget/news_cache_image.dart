import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsCacheImage extends StatelessWidget {
  final String imageUrl;
  final double? width, height;
  final BoxFit? fit;

  const NewsCacheImage(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit,
  });

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: imageUrl,
      //imageBuilder: (context, imageProvider) => _imageWidget(imageProvider),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) {
        return _imageWidget(
          const AssetImage('assets/images/yandexbrowser.png'),
        );
      },
    );
  }
}