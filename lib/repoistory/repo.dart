import '../models/NewsDataModel.dart';
import '../models/sources.dart';

abstract class BaseRepository {
  Future<SourcesResponse> getSources({required String? category});

  Future<NewsDataModel> getNewsData({String sourceID,String Search, String language});
}
