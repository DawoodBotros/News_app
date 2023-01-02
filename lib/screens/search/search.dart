import 'package:flutter/material.dart';

import '../../models/NewsDataModel.dart';
import '../../shared/network/remote/api_manager.dart';
import '../../shared/styles/colors.dart';
import '../news_card.dart';

class SearchScreen extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        showResults(context);
      }, icon: Icon(Icons.search,size: 25,)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon:Icon(Icons.clear,size: 25,), onPressed: () {
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return  FutureBuilder<NewsDataModel>(
      future: ApiManager.getNewsData(
          Search:   query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
                color: colorGreen,
              ));
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.data?.message ?? "Has Error"),
              TextButton(
                onPressed: () {},
                child: Text("Try Again"),
              ),
            ],
          );
        }
        if (snapshot.data?.status != "ok") {
          return Column(
            children: [
              Text(snapshot.data?.message ?? "Has Error"),
              TextButton(
                onPressed: () {},
                child: Text("Try Again"),
              ),
            ],
          );
        }
        var news = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return NewsCard(news[index]);
              }),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Suggestions"));
  }
  
}
