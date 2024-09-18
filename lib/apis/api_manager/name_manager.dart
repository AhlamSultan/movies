import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/apis/api_borows/name_movie.dart';
import 'package:movies/apis/api_borows/category_names.dart';
import 'package:movies/apis/api_borows/list_movies.dart';
//as http;
//import 'package:movies/apis/api_search/name_movise.dart';
class ApiManager{
//https://api.themoviedb.org/3/search/movie

  static Future<ListMovies> getList() async {
    Response listMovise =
    await get(Uri.parse('https://api.themoviedb.org/3/genre/movie/list'));
    if(listMovise.statusCode >= 200 && listMovise.statusCode < 300){
      Map json = jsonDecode(listMovise.body) as Map;
      return ListMovies.fromJson(json);
    }else {
      throw "Something went wrong please try again later";
    }
  }


  static Future<CategoryName> getCategoryName() async {
    Response categoryName =
    await get(Uri.parse('https://api.themoviedb.org/3/discover/movie'));
    if(categoryName.statusCode >= 200 && categoryName.statusCode < 300){
      Map json = jsonDecode(categoryName.body) as Map;

      return CategoryName.fromJson(json);
    }else {
      throw "Something went wrong please try again later";
    }
  }

  static Future<NameMovie> getName(String query) async {
    Response nameMovise =
    await get(Uri.parse('https://api.themoviedb.org/3/search/movie?query=${query}'));
    if(nameMovise.statusCode >= 200 && nameMovise.statusCode < 300){
      Map json = jsonDecode(nameMovise.body) as Map;
      return NameMovie.fromJson(json);
    }else {
      throw "Something went wrong please try again later";
    }
  }




}
