import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/apis/api_borows/category_names.dart';
import 'package:movies/apis/api_borows/list_movies.dart';
import 'package:movies/apis/api_manager/name_manager.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {

int index=0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ListMovies>
      (future: ApiManager.getList() ,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: (){}, child: Text("Retry")),
              ],
            );
          }
          else if(snapshot.hasData){
            List<ListMovies> tabs=snapshot.data as List<ListMovies>;
            return ListView.builder(
              itemCount: tabs.length,
                itemBuilder: (context,index) {
                  return Padding(padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text(tabs[index].page as String),
                      ],
                    ),

                  );
                }
          );

          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        }

        );
  }
  /*

        return builTabsList(snapshot.data!.results!.cast<ListMovies>());

    builTabsList (List<ListMovies> results){
  List<widget> tabs=results.map((ListMovies) => Text(ListMovies.results??'')).toList();
return DefaultTabController(length: results.length,
    child: Column(
children: [
  TabBar(tabs: [Text('tab1'),Text('data')]),
  Expanded(child: TabBarView(children: [Text('tab1'),Text('data')],))
],
    ));

  }

   */


}





