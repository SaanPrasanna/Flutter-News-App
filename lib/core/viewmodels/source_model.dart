import '../../locator.dart';
import '../enums/viewstate.dart';
import '../models/source.dart';
import '../services/api_service.dart';
import 'base_model.dart';

class SourceModel extends BaseModel {
  Api _api = locator<Api>();

  NewsSource newsSource;

  Future<NewsSource> getNewsSource() async {
    setState(ViewState.Busy);
    newsSource = await _api.getNewsSouces();
    setState(ViewState.Idle);
    return newsSource;
  }
}
