import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/shared/styles/colors.dart';

import 'details/details.dart';

class NewsCard extends StatelessWidget {
  Articles articles;

  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, NewsDetailsScreen.routeName,arguments: articles),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorGreen)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(imageUrl: articles.urlToImage ?? "",
              placeholder:(context,url) => Center(child: CircularProgressIndicator(color: colorGreen,)) ,
            errorWidget: (context,url,error) => Icon(Icons.error)),
            // Image.network(articles.urlToImage ?? "",height: 180,fit: BoxFit.fill,),
            Text(articles.author ?? "",style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.grey,
            ),),
            Text(articles.title ?? "",style: Theme.of(context).textTheme.subtitle1,),
            Text(articles.publishedAt?.substring(0,10) ?? "",textAlign: TextAlign.right,),

          ],
        ),
      ),
    );
  }
}
