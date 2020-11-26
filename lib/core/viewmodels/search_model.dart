import '../../locator.dart';
import '../enums/viewstate.dart';
import '../models/news.dart';
import '../services/api_service.dart';
import 'base_model.dart';

class SearchModel extends BaseModel {
  Api _api = locator<Api>();

  News news;

  Future<News> getSearchNews(String keyword) async {
    setState(ViewState.Busy);
    news = await _api.getSearchResult(keyword);
    setState(ViewState.Idle);
    return news;
  }
}
