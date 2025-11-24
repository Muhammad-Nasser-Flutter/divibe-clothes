import 'package:cloth_ecommerce/core/Api/quest_dio.dart';

import '../helpers/service_locator.dart';

abstract class BaseRepository {
  late QuestDio dio;

  BaseRepository() {
    dio = getIt.get<QuestDio>();
  }
}
