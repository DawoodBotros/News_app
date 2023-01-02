import 'package:flutter/material.dart';
import 'package:news/models/categoryData.dart';
import 'package:news/screens/tab_controller.dart';

import '../models/sources.dart';
import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
 CategoryData categoryData;

 HomeScreen(this.categoryData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(category: categoryData.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.data?.status != "ok") {
          return Center(child: Text(snapshot.data!.message!));
        }

        var sources = snapshot.data?.sources ?? [];
        return TabControllerScreen(sources);
      },
    );
  }
}
