/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyCategory extends StatelessWidget{
  String category;
  MyCategory({required this.category});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Stack(
        children: [
          Image.asset('assets/images/movies_category.jpg'),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width*0.3,
                  left: MediaQuery.of(context).size.width*0.1
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width*0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

 */
import 'package:flutter/material.dart';

class Category {

  String title;
  String imagePath;
  Category(
      {
        required this.title,
        required this.imagePath,
       });

  static List<Category> categories = [
   Category(title:"Action", imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Adventure', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Animation', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Comedy', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Crime', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Documentary', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Drama', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Family', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Fantasy', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' History', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Horror', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Music', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Mystery', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Romance', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Science Fiction', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' TV Movie', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Thriller', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' War', imagePath: 'assets/images/movies_category2.jpg'),
    Category(title:' Western', imagePath: 'assets/images/movies_category2.jpg'),




  ];
}
