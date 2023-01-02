import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/sources.dart';
import 'package:news/shared/components/components.dart';

import '../../constants/constants.dart';

class ApiManager {


  static Future<SourcesResponse> getSources(
      {String? category,}) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=b2051aef415c471883257d15d456c8af"
    var URL = Uri.https(BASE, '/v2/top-headlines/sources',
        {"apiKey": APIKEY,
          "category":category,

        });
    try {
      Response sources = await http.get(URL);
      print(sources.statusCode);
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw (e);
    }
  }

  static Future<NewsDataModel> getNewsData(
      {String? sourceID, String? Search,String? language}) async{
    Uri URL = Uri.https(BASE, '/v2/everything', {
      "apiKey": APIKEY,
      "sources" : sourceID,
      "q" : Search,
      "language" : language
    });
    print(language);
    Response response = await http.get(URL);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }
}
