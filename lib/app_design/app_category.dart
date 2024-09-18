import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/movie_details/movie_category.dart';

class AppCategory extends StatelessWidget {
  final Category category;
  const AppCategory({super.key,required this.category});

//
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height *.22,
          ),
          Text(
            category.title,
            style: const TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,),
          )
        ],

      ),

    );
  }
}
