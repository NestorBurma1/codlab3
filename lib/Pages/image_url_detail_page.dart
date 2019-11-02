import 'package:flutter/material.dart';

class ImageDetailsPageUrl extends StatelessWidget {
  const ImageDetailsPageUrl({Key key, this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Details URL')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Image.network(image,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center),
          ),
        ));
  }
}
