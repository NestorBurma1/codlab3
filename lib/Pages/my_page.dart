import 'package:codlab3/Pages/image_details_page.dart';
import 'package:flutter/material.dart';
import 'package:codlab3/Pages/image_url_detail_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyPageState createState() => _MyPageState();
}

Ink _showImage(BuildContext context, Image imageShow) {
  return Ink.image(
    image: imageShow.image,
    fit: BoxFit.cover,
    child: InkWell(onTap: () {
      Navigator.push<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
            builder: (context) => ImageDetailsPage(assetPath: imageShow)),
      );
    }),
  );
}

TextEditingController textFieldController =
    TextEditingController(text: 'https://picsum.photos/id/237/200/300');
void _showAlert(BuildContext context, String text) {
  showDialog<AlertDialog>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Paste image URL'),
          content: TextField(
            controller: textFieldController,
            decoration: InputDecoration(hintText: 'URL'),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
                textFieldController.text =
                    'https://picsum.photos/id/237/200/300';
              },
            ),
            FlatButton(
                child: const Text('Show and add'),
                onPressed: () {
                  if (textFieldController.text.isNotEmpty) {
                    images.add(Image.network(textFieldController.text));
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(builder: (context) {
                        return ImageDetailsPageUrl(
                            image: textFieldController.text);
                      }),
                    );
                  }
                })
          ],
        );
      });
}

List images = <Image>[
  Image.asset('resources/cats/cat1.jpg'),
  Image.asset('resources/cats/cat2.jpg'),
  Image.asset('resources/cats/cat3.jpg'),
  Image.asset('resources/cats/cat4.jpg'),
  Image.asset('resources/cats/cat5.jpg')
];

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Cats grid',
              style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 30.0,
                fontFamily: 'BowlbyOneSC',
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return _showAlert(context, 'https://picsum.photos/id/237/200/300');
        },
        child: Icon(Icons.add),
      ),
      body: GridView.builder(
          itemCount: images.length,
          padding: const EdgeInsets.all(5),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return _showImage(context, images[index]);
          }),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
