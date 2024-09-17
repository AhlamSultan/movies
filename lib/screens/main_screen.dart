import 'package:flutter/material.dart';
import 'package:movies/app_design/app_colors.dart';
import 'package:movies/screens/taps/browse.dart';
import 'package:movies/screens/taps/home_/home.dart';
import 'package:movies/screens/taps/search.dart';
import 'package:movies/screens/taps/watch_list.dart';


class MainScreen extends StatefulWidget {
   const MainScreen({super.key});
  static const String routeName = 'mainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTap = 0;
  List <Widget> taps = [ const Home() , const Search() , const Browse() , const WatchList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: AppColors.bottomBar),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.accent,
          showUnselectedLabels: true,
          backgroundColor: AppColors.bottomBar,
          currentIndex: selectedTap,
          onTap: (index){
            selectedTap = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/Home_icon.png")) , label: "HOME"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/search-2.png")) , label: "SEARCH"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/Icon_material-movie.png")) ,label: "BROWSE"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/Icon_ionic-md-bookmarks.png")) , label: "WATCHLIST"),
          ],
        ),
      ),
      body: taps[selectedTap] ,
    );
  }
}