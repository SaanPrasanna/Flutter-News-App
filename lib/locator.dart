import 'package:get_it/get_it.dart';
import 'package:newsapi/core/viewmodels/source_model.dart';

import 'core/services/api_service.dart';
import 'core/viewmodels/headline_model.dart';
import 'core/viewmodels/search_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => HeadlineModel());
  locator.registerFactory(() => SearchModel());
  locator.registerFactory(() => SourceModel());

}
