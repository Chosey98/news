import 'package:flutter/material.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/view/Component/cardnterest.dart';

class GredScreen extends StatefulWidget {
  const GredScreen({Key? key}) : super(key: key);

  @override
  State<GredScreen> createState() => _GredScreenState();
}

class _GredScreenState extends State<GredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              Text(
                "What’s interest you?",
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 24, color: black),
              ),
              Text(
                "Pick topics to start reading and saving news",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 12, color: black),
              ),
              GridView.extent(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(20),
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                children: [
                  CardInterest(textnIterest: "Technology", ImageIterest: "assets/image/hassan.jpg"),
                  CardInterest(textnIterest: "Technology", ImageIterest: "assets/image/hassan.jpg"),
                  CardInterest(textnIterest: "Technology", ImageIterest: "assets/image/hassan.jpg"),
                  CardInterest(textnIterest: "Technology", ImageIterest: "assets/image/hassan.jpg"),
                  CardInterest(textnIterest: "Technology", ImageIterest: "assets/image/hassan.jpg"),
                  CardInterest(textnIterest: "Technology", ImageIterest: "assets/image/hassan.jpg"),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
