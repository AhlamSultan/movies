import 'dart:convert';

import 'package:http/http.dart';

import '../new_realeases.dart';
import '../popular.dart';
import '../recommended.dart';

class ApiManager{
  static Future<Popular> getPopular () async {
    Response popularResponse = await get (Uri.parse("https://api.themoviedb.org/3/movie/popular"));
    if ( popularResponse.statusCode >= 200 && popularResponse.statusCode < 300 ){
      Map json = jsonDecode(popularResponse.body) as Map;
      return Popular.fromJson(json);
    }else {
      throw "Some thing went wrong , Please try again later" ;
    }
  }

  static Future<NewRealeases> getRealeases () async {
    Response realeasesResponse = await get (Uri.parse("https://api.themoviedb.org/3/movie/upcoming?Authorization"));
    if ( realeasesResponse.statusCode >= 200 && realeasesResponse.statusCode < 300 ){
      Map json = jsonDecode(realeasesResponse.body) as Map;
      return NewRealeases.fromJson(json);
    }else {
      throw "Some thing went wrong , Please try again later" ;
    }
  }

  static Future<Recommended> getRecommended () async {
    Response recommendedResponse = await get (Uri.parse("https://api.themoviedb.org/3/movie/top_rated"));
    if ( recommendedResponse.statusCode >= 200 && recommendedResponse.statusCode < 300){
      Map json = jsonDecode(recommendedResponse.body) as Map;
      return Recommended.fromJson(json);
    }else {
      throw "Some thing went wrong , Please try again later" ;
    }
  }
}