import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/apis/api_manager/api_manager.dart';
import 'package:movies/apis/popular.dart';
import 'package:movies/app_design/app_colors.dart';
import 'package:movies/screens/movie_details/movie_details.dart';
import 'package:movies/screens/taps/home_/poster.dart';
import 'package:movies/screens/taps/home_/poster_extension.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder <Popular> (
          future: ApiManager.getPopular(),
          builder: (context , snapshot){
            if (snapshot.hasError){
              return findError();
            } else if (snapshot.hasData){
              return Stack(
                children: [
                  const Image(
                    image: AssetImage("assets/images/Image_large.png"),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(150, 60, 50, 50),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_circle,
                          size: 80,
                          color: Colors.white,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 90),
                    child:
                    Image(image: AssetImage("assets/images/ImageSmall.png")),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 12, top: 86),
                      child: Icon  (
                        Icons.bookmark,
                        color: AppColors.secondary.withOpacity(0.7),
                        size: 35,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, top: 79),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150, top: 210),
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, MovieDetails.routeName);
                            },
                            child: Text(
                              "Dora and the lost city of gold",
                              style: GoogleFonts.inter(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(right: 90),
                          child: Text(
                            "2019  PG-13  2h 7m",
                            style: GoogleFonts.inter(
                                color: AppColors.secondaryText,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator(color: AppColors.accent,));
            }
          }
      ),
    );

















      Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                const Image(
                  image: AssetImage("assets/images/Image_large.png"),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(150, 60, 50, 50),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle,
                        size: 80,
                        color: Colors.white,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 90),
                  child:
                  Image(image: AssetImage("assets/images/ImageSmall.png")),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 12, top: 86),
                    child: Icon  (
                      Icons.bookmark,
                      color: AppColors.secondary.withOpacity(0.7),
                      size: 35,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 79),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150, top: 210),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, MovieDetails.routeName);
                          },
                          child: Text(
                            "Dora and the lost city of gold",
                            style: GoogleFonts.inter(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 90),
                        child: Text(
                          "2019  PG-13  2h 7m",
                          style: GoogleFonts.inter(
                              color: AppColors.secondaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(  width: 420,
              height: 187,
              color: AppColors.secondary,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "New Releases",
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryText),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Poster(image: "assets/images/Narcos.png" , marginRight: 10, bookMarkColor: AppColors.secondary, posterIcon: Icons.add, marginBottom: 0,),
                              Poster(image: "assets/images/dead_pool.png" , marginRight: 10, bookMarkColor: AppColors.secondary, posterIcon: Icons.add, marginBottom: 0,),
                              Poster(image: "assets/images/Annabelle.png" , marginRight: 10, bookMarkColor: AppColors.secondary, posterIcon: Icons.add, marginBottom: 0,),
                              Poster(image: "assets/images/Toy_story.png" , marginRight: 10, bookMarkColor: AppColors.secondary, posterIcon: Icons.add, marginBottom: 0,),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 565,
              height: 246,
              color: AppColors.secondary,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Recommended",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.primaryText),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context , index){
                            return const PosterExtention();
                          }
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column findError() {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Some thing went wrong" , style: TextStyle(color: AppColors.accent , fontSize: 18),),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                    ),
                      onPressed: (){},
                      child: const Text("Retry" , style: TextStyle(color: Colors.white),)
                  ),
                ),
              ],
            );
  }
}

//const SizedBox(height: 10,),
//Text("New Releases " ,style: GoogleFonts.inter(fontSize: 16 , fontWeight: FontWeight.w400 , color: AppColors.primaryText),),
//const SizedBox(height: 10,),



