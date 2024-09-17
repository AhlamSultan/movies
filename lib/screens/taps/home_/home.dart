import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/apis/api_manager/api_manager.dart';
import 'package:movies/apis/new_realeases.dart';
import 'package:movies/apis/popular.dart';
import 'package:movies/apis/recommended.dart';
import 'package:movies/app_design/app_colors.dart';
import 'package:movies/screens/movie_details/movie_details.dart';
import 'package:movies/screens/taps/home_/poster.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    ApiManager.getPopular();
    ApiManager.getRealeases();
    ApiManager.getRecommended();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: FutureBuilder <Popular> (
                      future: ApiManager.getPopular(),
                      builder: (context , snapshot){
                        if (snapshot.hasError){
                          return findError();
                        } else if (snapshot.hasData){
                          return buildPopularMovies(snapshot.data as Popular);
                        } else {
                          return const Center(child: CircularProgressIndicator(color: AppColors.accent,));
                        }
                      }
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  flex: 1,
                  child: FutureBuilder <NewRealeases> (
                      future: ApiManager.getRealeases(),
                      builder: (context , snapshot){
                        if (snapshot.hasError){
                          return findError();
                        } else if (snapshot.hasData){
                          return buildRealeasesMovies(snapshot.data as NewRealeases);
                        } else {
                          return const Center(child: CircularProgressIndicator(color: AppColors.accent,));
                        }
                      }
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 1,
                  child: FutureBuilder <Recommended> (
                      future: ApiManager.getRecommended(),
                      builder: (context , snapshot){
                        if (snapshot.hasError){
                          return findError();
                        } else if (snapshot.hasData){
                          return buildRecommendedMovies(snapshot.data as Recommended);
                        } else {
                          return const Center(child: CircularProgressIndicator(color: AppColors.accent,));
                        }
                      }
                  ),
                ),
              ],
            ),
      ),
          );
  }

  Container buildRecommendedMovies(final Recommended results) {
    return Container(
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
                                      return Container(
                                        margin: const EdgeInsets.only(right: 10),
                                        width: 100,
                                        height: 184,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(52, 53, 52, 1),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            Poster(image: "https://image.tmdb.org/t/p/w500/${results.results?[index].posterPath}",
                                              marginRight: 0,
                                              bookMarkColor: AppColors.secondary,
                                              posterIcon: Icons.add,
                                              marginBottom: 0,
                                              width: 100,
                                              height: 130,
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 400),
                                                    child: Row(
                                                      children: [
                                                         Image.network(
                                                              "assets/images/star-2.png",
                                                           width: 10,
                                                           height: 9,
                                                         ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "${results.results?[index].voteCount}",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: GoogleFonts.poppins(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w400,
                                                              color: AppColors.primaryText),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 7,),
                                                  Text("${results.results?[index].originalTitle}",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w400,
                                                        color: AppColors.primaryText,
                                                      )),
                                                  const SizedBox(height: 7,),
                                                  Text("${results.results?[index].releaseDate}",
                                                    overflow: TextOverflow.ellipsis ,
                                                    style: GoogleFonts.inter(fontWeight: FontWeight.w400 ,
                                                        fontSize: 8 ,
                                                        color:AppColors.secondaryText),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                ),

                              ),
                            ],
                          ),
                        ),
                      );
  }

  Container buildRealeasesMovies(final NewRealeases results) {
    return Container(  width: 420,
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
                                        Poster(image: "https://image.tmdb.org/t/p/w500/${results.results?[index].posterPath}" ,
                                          marginRight: 10,
                                          bookMarkColor: AppColors.secondary,
                                          posterIcon: Icons.add,
                                          marginBottom: 0,
                                          width: 150,
                                          height: 200,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
  }

  Widget buildPopularMovies(final Popular results) {
    return CarouselSlider.builder(
      itemCount: results.results?.length,
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Stack(
          children: [
             Image.network(
               ("https://image.tmdb.org/t/p/w500/${results.results?[index].backdropPath}"),
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
             Padding(
              padding: const EdgeInsets.only(left: 20, top: 90),
              child:
              Image.network
                  ("https://image.tmdb.org/t/p/w500/${results.results?[index].posterPath}"),
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
              padding: const EdgeInsets.only(left: 150, top: 168),
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MovieDetails.routeName);
                      },
                      child: Text(
                        "${results.results?[index].originalTitle}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 90),
                    child: Text(
                      "${results.results?[index].releaseDate}",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
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
