import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies/app_design/app_category.dart';
import 'package:movies/app_design/app_colors.dart';
import 'package:movies/screens/movie_details/movie_category.dart';
import 'package:movies/screens/taps/new_screen.dart';
class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  @override
  Widget build(BuildContext context) {
    return Padding( padding:
    EdgeInsets.only( top: 40,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text( 'Belongs Category',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                right: 22,left: 22,
                  // top: MediaQuery.of(context).size.height*.2,
                ),
                child: GridView.builder(
                  itemCount: Category.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 44,
                    mainAxisSpacing: 2,

                  ),
                  itemBuilder: (context, index) => InkWell(
                  // onCategoryClick(Category.categories[index](
                    onTap:() {
                      final categry=MaterialPageRoute(builder: (context)=>NewScreen());
                   Navigator.push(context,categry);

                    },
                    child: AppCategory(category: Category.categories[index]),

                  ),
                ),

            )

            ),
        ],
      ),
    );
  }

}

