import 'package:codlab3/Pages/image_details_page.dart';

import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPageState createState() => _MyPageState();
}

Ink showImage(BuildContext context, String imageName) => Ink.image(
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


class _MyPageState extends State<MyPage> {
  final List<String> images = [
    'resources/cats/cat1.jpg',
    'resources/cats/cat2.jpg',
    'resources/cats/cat3.jpg',
    'resources/cats/cat4.jpg',
    'resources/cats/cat5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Image.network('https://picsum.photos/id/237/200/300'),
             
        child: Icon(Icons.add),
      ),
      body: GridView.builder(
          itemCount: images.length,
          padding: const EdgeInsets.all(5),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return showImage(context, images[index]);
          }),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
