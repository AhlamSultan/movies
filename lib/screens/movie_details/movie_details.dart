import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/apis/api_manager/api_manager.dart';
import 'package:movies/apis/similar.dart';
import 'package:movies/app_design/app_colors.dart';
import 'package:movies/screens/taps/home_/poster.dart';

import '../../apis/details.dart';

class MovieDetails extends StatefulWidget {

  const MovieDetails({super.key});

  static const String routeName = "movie_details";

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(29, 30, 29, 1),
        title: Text(
          "Dora and the lost city of gold",
          style: GoogleFonts.inter(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
              fontSize: 20),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: FutureBuilder <Details> (
                future: ApiManager.getDetails(movieId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return findError();
                  } else if (snapshot.hasData) {
                    return buildMovieDetails(snapshot.data as Details);
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.accent,
                    ));
                  }
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: FutureBuilder<Similar>(
                future: ApiManager.getSimilar(movieId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return findError();
                  } else if (snapshot.hasData) {
                    return buildSimilarMovies(snapshot.data as Similar);
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.accent,
                        ));
                  }
                }),
          ),
        ],
      ),
    );
  }

  Container buildSimilarMovies(final Similar results) {
    return Container(
          width: 434,
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
                  "More Like This",
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
                      itemBuilder: (context, index) {
                        return Container();
                      }),
                ),
              ],
            ),
          ),
        );
  }

  Column buildMovieDetails(final Details results) {
    return Column(
      children: [
        Stack(
          children: [
             Image.network("https://image.tmdb.org/t/p/w500/${results.posterPath}",
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(160, 60, 50, 10),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle,
                    size: 80,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${results.originalTitle}",
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryText),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${results.releaseDate}",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.secondaryText),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Poster(
                    image: "https://image.tmdb.org/t/p/w500/${results.posterPath}",
                    marginRight: 0,
                    bookMarkColor: AppColors.secondary,
                    posterIcon: Icons.add,
                    marginBottom: 0,
                    width: 100,
                    height: 130,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          buildActionField(),
                          const SizedBox(
                            width: 10,
                          ),
                          buildActionField(),
                          const SizedBox(
                            width: 10,
                          ),
                          buildActionField(),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      buildActionField(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        """${results.overview}""",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.secondaryText),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Image(
                            image: AssetImage("assets/images/star-2.png"),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${results.voteCount}",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryText),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container buildActionField() {
    return Container(
      width: 65,
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryText, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 5, 0, 0),
        child: Text(
          "Action",
          style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText),
        ),
      ),
    );
  }

  Column findError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Some thing went wrong",
          style: TextStyle(color: AppColors.accent, fontSize: 18),
        ),
        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
              ),
              onPressed: () {},
              child: const Text(
                "Retry",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ],
    );
  }
}

