import 'package:flutter/material.dart';

import '../../constant.dart';

class NewsCard extends StatelessWidget {
  String newsImage;
  String newsText;
  String newsname;
  String newsTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        margin:  const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network("$newsImage",

                  height: MediaQuery.of(context).size.height/10,
                  width: 80,
                  ),
                ),
              ),
              SizedBox(width: 5,) ,
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$newsname",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "$newsText",
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,

                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "$newsTime",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Subtext),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  NewsCard({
    required this.newsImage,
    required this.newsText,
    required this.newsname,
    required this.newsTime,
  });
}
