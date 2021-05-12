import 'dart:convert';
import 'package:news/model/feed.dart';
import 'package:http/http.dart';

class SwaggerAPI {
  final endPointUrl = "https://test.spaceflightnewsapi.net/api/v2/articles";

  Future<List<Feed>> getArticle() async {
    var url = Uri.parse(endPointUrl);
    Response res = await get(url);

    if (res.statusCode == 200) {
      List<Feed> feed = [];
      List<dynamic> values;
      values = json.decode(res.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            feed.add(Feed.fromJson(map));
          }
        }
      }

      return feed;
    } else {
      throw ("Can't fetch data");
    }
  }
}
