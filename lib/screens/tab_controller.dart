import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/provider/my_provider.dart';
import 'package:news/screens/news_card.dart';
import 'package:news/screens/tab_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import 'package:news/shared/styles/colors.dart';
import 'package:provider/provider.dart';

import '../models/sources.dart';

class TabControllerScreen extends StatelessWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        DefaultTabController(
            length: sources.length,
            child: TabBar(
              onTap: (index) {
                provider.ChangeSelected(index);
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: sources
                  .map(
                    (source) =>
                    Tab(
                      child: TabItem(source,
                          sources.indexOf(source) == provider.selectedIndex),
                    ),
              )
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
          future: ApiManager.getNewsData(
            sourceID: sources[provider.selectedIndex].id ?? "",
            language: provider.language,
          ),
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
        ),
      ],
    );
  }
}
