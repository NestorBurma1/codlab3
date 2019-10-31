import 'package:codlab3/Pages/my_page.dart';
import 'package:flutter/material.dart';
class ImageDetailsPage extends StatelessWidget {
  final String assetPath;

  ImageDetailsPage({
    Key key, @required this.assetPath
  }) : assert(assetPath != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Details'),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: showImage(context, assetPath)
    ),
        ),
    );

  }
}