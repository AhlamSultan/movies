import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:movies/apis/similar.dart';
import 'package:movies/apis/details.dart';

import '../new_realeases.dart';
import '../popular.dart';
import '../recommended.dart';

class ApiManager{
  static Future<Popular> getPopular () async {
    Response popularResponse = await get (Uri.parse("https://api.themoviedb.org/3/movie/popular"),
        headers: {
      HttpHeaders.authorizationHeader : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjZkYzE2YTE4OWU2NThlMTJlNTk1MzM5YTk5NWFjNyIsIm5iZiI6MTcyNTk3OTU0Ny4wMzM3MSwic3ViIjoiNjZkYzBmZTVmYTljMGY4ZWFkOWRiNmIwIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.fnECZEdfXhzAETmcUqHXz01C2C6VSZFSMQE39GaH_ck"
        }
    );
    if ( popularResponse.statusCode >= 200 && popularResponse.statusCode < 300 ){
      Map json = jsonDecode(popularResponse.body) as Map;
      return Popular.fromJson(json);
    }else {
      throw "Some thing went wrong , Please try again later" ;
    }
  }

  static Future<NewRealeases> getRealeases () async {
    Response realeasesResponse = await get (Uri.parse("https://api.themoviedb.org/3/movie/upcoming?Authorization"),
        headers: {
          HttpHeaders.authorizationHeader : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjZkYzE2YTE4OWU2NThlMTJlNTk1MzM5YTk5NWFjNyIsIm5iZiI6MTcyNjA3MDg4MS45Nzg5NDIsInN1YiI6IjY2ZGMwZmU1ZmE5YzBmOGVhZDlkYjZiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.uIuer_QsjGiIc6_rycmtt65YmFfpaxoNDH0lGP95kEs"
        }
    );
    if ( realeasesResponse.statusCode >= 200 && realeasesResponse.statusCode < 300 ){
      Map json = jsonDecode(realeasesResponse.body) as Map;
      return NewRealeases.fromJson(json);
    }else {
      throw "Some thing went wrong , Please try again later" ;
    }
  }

  static Future<Recommended> getRecommended () async {
    Response recommendedResponse = await get (Uri.parse("https://api.themoviedb.org/3/movie/top_rated"),
        headers: {
          HttpHeaders.authorizationHeader : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjZkYzE2YTE4OWU2NThlMTJlNTk1MzM5YTk5NWFjNyIsIm5iZiI6MTcyNTc5MjQyMC41MDA2MjksInN1YiI6IjY2ZGMwZmU1ZmE5YzBmOGVhZDlkYjZiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IqF6BSxTNsUICNwwJF6w5FAxGM5DLH5Y47rqMUHakt8"
        }
    );
    if ( recommendedResponse.statusCode >= 200 && recommendedResponse.statusCode < 300){
      Map json = jsonDecode(recommendedResponse.body) as Map;
      return Recommended.fromJson(json);
    }else {
      throw "Some thing went wrong , Please try again later" ;
    }
  }

  static Future<Details> getDetails (int movieId) async {
    Response movieDetailsResponse = await get (Uri.parse("https://api.themoviedb.org/3/movie/$movieId?language=en-US"),
        headers: {
          HttpHeaders.authorizationHeader : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjZkYzE2YTE4OWU2NThlMTJlNTk1MzM5YTk5NWFjNyIsIm5iZiI6MTcyNjE2MjM4Ny4yNTY2MDMsInN1YiI6IjY2ZGMwZmU1ZmE5YzBmOGVhZDlkYjZiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UExfYxW5FHbVUxfuKpi3WJ4_5DnufRdarnRV_NF5Ibo"
        }
    );
    if ( movieDetailsResponse.statusCode >= 200 && movieDetailsResponse.statusCode < 300){
      dynamic json = jsonDecode(movieDetailsResponse.body) as Map;
      return Details.fromJson(json);
    }else {
      throw "Some thing went wrong , Please try again later" ;
    }
  }

  static Future<Similar> getSimilar (int movieId) async {
    Response similarResponse = await get (Uri.parse("https://api.themoviedb.org/3/movie/$movieId/similar?language=en-US&page=1"),
        headers: {
          HttpHeaders.authorizationHeader : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjZkYzE2YTE4OWU2NThlMTJlNTk1MzM5YTk5NWFjNyIsIm5iZiI6MTcyNjU2NjI3OS40MDU2NzIsInN1YiI6IjY2ZGMwZmU1ZmE5YzBmOGVhZDlkYjZiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cga4xvekxObiePfpP_PIkkjzpA5W2FjR2Sqg_FO__-w"
        }
    );
    if ( similarResponse.statusCode >= 200 && similarResponse.statusCode < 300){
      dynamic json = jsonDecode(similarResponse.body) as Map;
      return Similar.fromJson(json);
    }else {
      throw "Some thing went wrong , Please try again later" ;
    }
  }
}