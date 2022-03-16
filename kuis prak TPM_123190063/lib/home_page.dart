import 'package:flutter/material.dart';

import 'app_page.dart';
import 'data_dummy.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PlayStore"),
      ),
      body: Container(
        child: _createListCard(),
      )
    );
  }

  Widget _createListCard() {
    var appList = getAllApp();

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(appList[index], context);
      },
      itemCount: appList.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: const EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget _createCard(AppStore data, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AppPage(
                name: data.name,
                imageLogo: data.imageLogo,
                developer: data.developer,
                genre: data.genre,
                rating: data.rating,
                description: data.description,
                appLink: data.appLink,
                imageUrls: data.imageUrls);
          }));
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(data.imageLogo),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(data.name),
                  SizedBox(height:10),
                  Text(data.genre),
                  SizedBox(height:10),
                  Text(data.rating ),
                  new Icon(Icons.star),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
