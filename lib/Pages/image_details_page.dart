import 'package:flutter/material.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({Key key, this.assetPath}) : super(key: key);
  final Image assetPath;

  Ink _showImage(BuildContext context, Image imageName) {
    return Ink.image(
      image: imageName.image,
      fit: BoxFit.cover,
      child: InkWell(onTap: () {
        Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
              builder: (context) => ImageDetailsPage(assetPath: imageName)),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Details',
            style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 30.0,
              fontFamily: 'BowlbyOneSC',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: _showImage(context, assetPath)),
      ),
    );
  }
}
