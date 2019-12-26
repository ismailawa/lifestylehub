import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_hub/models/category.dart';
import 'package:life_style_hub/values/colors.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: ExactAssetImage(category.imageUrl), fit: BoxFit.cover),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 10),
          child: Text(
            category.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: LSHBlackColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: <Widget>[
              Text("${category.trainers} trainers,",
                  style: TextStyle(fontStyle: FontStyle.italic, color: LSHBlackColor)),
              Text("${category.lessons} lessons",
                  style: TextStyle(fontStyle: FontStyle.italic, color: LSHBlackColor))
            ],
          ),
        )
      ],
    );
  }
}
