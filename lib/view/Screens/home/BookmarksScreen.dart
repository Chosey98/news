import 'package:flutter/material.dart';
import 'package:newsapp/constant.dart';

import '../../../controller/restapicontroller.dart';
import '../../Component/NewsCard.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Bookmarks",
          style: TextStyle(
              color: black, fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        future: RestApiController.fetchArticles(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
                  itemCount: snapshot.data.length,
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
    );
  }
}
