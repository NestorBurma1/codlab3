import 'package:flutter/material.dart';
class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({Key key, this.assetPath}) : super(key: key);
  final String assetPath;

  Ink _showImage(BuildContext context, String imageName) => Ink.image(
    image: AssetImage(imageName),
    fit: BoxFit.cover,
    child: InkWell(onTap: () {
      Navigator.push<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
            builder: (context) => ImageDetailsPage(assetPath: imageName)),
      );
    }),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Details'),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: _showImage(context, assetPath)
    ),
        ),
    );

  }
}