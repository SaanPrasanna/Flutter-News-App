import '../../locator.dart';
import '../enums/viewstate.dart';
import '../models/news.dart';
import '../services/api_service.dart';
import 'base_model.dart';

class HeadlineModel extends BaseModel {
  Api _api = locator<Api>();

  News news;

  Future<News> getHeadlineNews() async {
    setState(ViewState.Busy);
    news = await _api.getHeadlines();
    setState(ViewState.Idle);
    return news;
  }
}
