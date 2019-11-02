import 'package:flutter/material.dart';
class ImageDetailsPageUrl extends StatelessWidget {
  const ImageDetailsPageUrl({Key key, this.image}) : super(key: key);
  final String image;

  Image _showImageUrl(BuildContext context, String imageName) {
    return
        Image.network(imageName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details URL')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: _showImageUrl(context, image),
        ),
      ),
    );

  }
}