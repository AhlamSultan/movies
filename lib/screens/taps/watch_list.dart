import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/app_design/app_colors.dart';
import 'package:movies/screens/taps/home_/poster.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Watchlist",
                style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryText),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Poster(
                            image: "assets/images/aline.png",
                            marginRight: 0,
                            bookMarkColor: AppColors.accent,
                            posterIcon: Icons.check,
                            marginBottom: 10,
                            width: 140,
                            height: 90,
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alita Battle Angel" , style: GoogleFonts.inter(fontWeight: FontWeight.w400 , fontSize: 15 , color: AppColors.primaryText),),
                              const SizedBox(height: 10,),
                              Text("2019" , style: GoogleFonts.inter(fontWeight: FontWeight.w400 , fontSize: 13 , color: AppColors.secondaryText),),
                              const SizedBox(height: 7,),
                              Text("Rosa Salazar, Christoph Waltz" , style: GoogleFonts.inter(fontWeight: FontWeight.w400 , fontSize: 13 , color: AppColors.secondaryText),),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border.symmetric(horizontal: BorderSide(width: 1 , color: Color.fromRGBO(112, 112, 112, 1))),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
