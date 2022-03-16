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
      body: Container(
        child:Column(
        children:[
          Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(imageLogo),
            ),
            Expanded(
                flex: 2,
                child: Text(name),
            ),
          ],
        ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if(await canLaunch(appLink)){
                    await launch(appLink);
                  } else{
                    throw 'Could not launch $appLink';
                  }
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
