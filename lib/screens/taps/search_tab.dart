import 'package:flutter/material.dart';

class SearchTab extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        query='';
        showSuggestions(context);
      }, icon: Icon(Icons.clear),),
    IconButton(onPressed: (){
      showResults(context);
    },
        icon:  Icon(Icons.search),),
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back));
  }
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Center(
        child: Text('No movies'),
      );
    }
    return Container();

  }
  
}