import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/sources.dart';
import 'package:news/repoistory/repo.dart';

import '../../shared/constants/constants.dart';

class Remote implements BaseRepository {
  @override
  Future<NewsDataModel> getNewsData(
      {String? sourceID, String? Search, String? language}) async {
    Uri URL = Uri.https(BASE, '/v2/everything', {
      "apiKey": APIKEY,
      "sources": sourceID,
      "q": Search,
      "language": language
    });
    print(language);
    Response response = await http.get(URL);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }

  @override
  Future<SourcesResponse> getSources({required String? category}) async {
    var URL = Uri.https(BASE, '/v2/top-headlines/sources', {
      "apiKey": APIKEY,
      "category": category,
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
}
