import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../../constant.dart';
import '../../../controller/restapicontroller.dart';
import '../../../model/newsmodel.dart';
import '../../Component/NewsCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();

  Future<List<NewsModel>> fetchArticles() async {
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
        // author: i["author"],
        title: i["title"],
        description: i["description"],
        url: i["url"],
        urlToImage: i["urlToImage"],
         publishedAt: i["publishedAt"],
         name: i["source"]['name']
      ));
    }
    print("urlToImage ====? ");

    return newsmodel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: SvgPicture.asset(logoSmall),
        backgroundColor: white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                print("search");
              },
              icon: Icon(
                Icons.search,
                color: black,
                size: 33,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: fetchArticles(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                print("snapshot ${snapshot.data}");
                return (snapshot.hasData)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider.builder(
                          itemCount: 4,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      "${snapshot.data[index].urlToImage}",
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 20,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Card(
                                            margin: EdgeInsets.all(5),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "${snapshot.data[index].name}",
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                          Card(
                                            margin: EdgeInsets.all(5),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "${snapshot.data[index].title}",
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ],
                                      ),
                                    ))
                                // Container(
                                //
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(20)),
                                //   child: Image.network(
                                //     "${snapshot.data[index].urlToImage}",
                                //     height:
                                //         MediaQuery.of(context).size.height / 2,
                                //     width: MediaQuery.of(context).size.width,
                                //     fit: BoxFit.fill,
                                //   ),
                                //   padding: EdgeInsets.all(5),
                                // )
                              ],
                            );
                          },
                          options: CarouselOptions(
                            initialPage: 0,
                            height: MediaQuery.of(context).size.height / 2,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            enlargeCenterPage: true,
                            // onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text(
                "Business",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, color: black),
              ),
            ),
            FutureBuilder(
              future: RestApiController.fetchCategoryArticles("business"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return (snapshot.hasData)
                    ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return NewsCard(
                            newsImage: snapshot.data[index].urlToImage,
                            newsText: snapshot.data[index].title,
                            newsname: snapshot.data[index].name,
                              newsTime: snapshot.data[index].publishedAt,
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text(
                "More from Business",
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, color: black),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text(
                "Sport",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, color: black),
              ),
            ),
            FutureBuilder(
              future: RestApiController.fetchCategoryArticles("sports"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return (snapshot.hasData)
                    ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard(
                      newsImage: snapshot.data[index].urlToImage,
                      newsText: snapshot.data[index].title,
                      newsname: snapshot.data[index].name,
                      newsTime: snapshot.data[index].publishedAt,
                    );
                  },
                )
                    : Center(child: CircularProgressIndicator());
              },
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text(
                "More from sports",
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, color: black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
