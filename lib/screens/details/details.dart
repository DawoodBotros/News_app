import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/styles/colors.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = "News_Details";

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: colorGreen,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        title: const Text("News Title"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorGreen)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                  imageUrl: articles.urlToImage ?? "",
                  placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: colorGreen,
                      )),
                  errorWidget: (context, url, error) => Icon(Icons.error)),
              // Image.network(articles.urlToImage ?? "",height: 180,fit: BoxFit.fill,),
              Text(
                articles.author ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 13, color: Colors.grey),
              ),
              Text(
                articles.title ?? "",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                articles.publishedAt?.substring(0, 10) ?? "",
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 20,
              ),
              Text("${articles.description}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      openUrl(articles.url);
                    },
                    child: Text("View Full Article"),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void openUrl(String? Url) async {
  if (Url == null) {
    return;
  }
  var uri = Uri.parse(Url);
  if (await canLaunchUrl(uri)) {
   await launchUrl(uri);
  }
}
