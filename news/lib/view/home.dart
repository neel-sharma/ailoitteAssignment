import 'package:news/controller/swagger_api.dart';

import 'package:flutter/material.dart';
import 'package:news/model/feed.dart';
import 'package:news/view/list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SwaggerAPI api = SwaggerAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News", style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.autorenew, color: Colors.black, size: 25),
            tooltip: "refresh page",
            onPressed: () {
              setState(() {});
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: api.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Feed>> snapshot) {
          if (snapshot.hasData) {
            List<Feed>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) =>
                  newsList(articles![index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
