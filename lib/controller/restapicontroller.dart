import 'dart:convert';

import '../constant.dart';
import '../model/newsmodel.dart';
import 'package:http/http.dart' as http;

class RestApiController {
  static Future<List<NewsModel>> fetchArticles() async {
    print("hi hassan");

    List<NewsModel> newsmodel = [];
    // var url=Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=e2e73cedbcdd4f95a6394eea00ff1ec9");
    var url =
        Uri.parse("${BaseUrl}top-headlines?country=$country&apiKey=$apiKey");
    print("url ====? $url");
    var respons = await http.get(url);
    print("respons ====? $respons");

    var responsbody = jsonDecode(respons.body)["articles"];
    print("responsbody ====? $responsbody");

    for (var i in responsbody) {
      newsmodel.add(NewsModel(
          title: i["title"],
          publishedAt: i["publishedAt"],
          description: i["description"],
          url: i["url"],
          urlToImage: i["urlToImage"],
          name: i["source"]['name']));
    }
    print("urlToImage ====? ${newsmodel[0].urlToImage}");

    return newsmodel;
  }

  static Future<List<NewsModel>> fetchCategoryArticles(String category) async {
    List<NewsModel> newsmodel = [];

    var url = Uri.parse(
        "${BaseUrl}top-headlines?country=$country&category=$category&apiKey=$apiKey");
    var respons = await http.get(url);
    var responsbody = jsonDecode(respons.body)["articles"];
    for (var i in responsbody) {
      newsmodel.add(NewsModel(
          publishedAt: i["publishedAt"],
          title: i["title"],
          description: i["description"],
          url: i["url"],
          urlToImage: i["urlToImage"],
          name: i["source"]['name']));
    }
    return newsmodel;
  }
}
