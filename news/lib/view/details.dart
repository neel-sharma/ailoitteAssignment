import 'package:news/model/feed.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final Feed? feed;

  DetailsPage({this.feed});

  @override
  Widget build(BuildContext context) {
    String? publishedAt, updatedAt;
    if (feed?.publishedAt != null) {
      String? pa = feed!.publishedAt;
      publishedAt = pa!.substring(8, 10) +
          ', ' +
          pa.substring(5, 7) +
          ', ' +
          pa.substring(0, 4);
    }
    if (feed?.updatedAt != null) {
      String? pa = feed!.publishedAt;
      updatedAt = pa!.substring(8, 10) +
          ', ' +
          pa.substring(5, 7) +
          ', ' +
          pa.substring(0, 4);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: "go back",
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: <Widget>[
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(feed?.imageUrl ?? ''),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text(
                      feed?.newsSite ?? '',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 20.0,
              ),
              Text(
                feed?.title ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                feed?.summary ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Published on: $publishedAt',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Updated on: $updatedAt',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Read more:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              GestureDetector(
                onTap: () async {
                  if (feed?.url != null) await launch(feed?.url ?? '');
                },
                child: Text(
                  feed?.url ?? '',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
