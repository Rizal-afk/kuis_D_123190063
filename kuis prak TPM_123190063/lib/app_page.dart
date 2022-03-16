import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppPage extends StatelessWidget {
  final String name;
  final String imageLogo;
  final String developer;
  final String genre;
  final String rating;
  final String description;
  final String appLink;
  final List<String> imageUrls;

  const AppPage(
      {Key? key,
        required this.name,
        required this.imageLogo,
        required this.developer,
        required this.genre,
        required this.rating,
        required this.description,
        required this.appLink,
        required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child:Column(
        children:[
          Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(imageLogo),
            ),
            Expanded(
                flex: 3,
                child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child:Column(
                  children:[
                    Row(children:[Text(name, style:TextStyle(fontWeight:FontWeight.bold, fontSize:18))]),
                    SizedBox(height:20),
                    Row(children:[Text(developer, style: TextStyle(color: Colors.blue))]),
                    SizedBox(height:20),
                    Row(children:[Text(genre)]),
                    SizedBox(height:20),
                    Row(children: [
                      Text(rating ),
                      new Icon(Icons.star),
                    ]
                    )
                  ]
                  )
                )
            ),
          ],
        ),
          Container(
            padding:EdgeInsets.symmetric(horizontal:20),
            child: Text(description)
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height:50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(appLink);
                }, // Respon ketika button ditekan
                child: Text("Download"),
              )
          )
      ]
      )
    )
    );
  }
}

Future<void> _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
