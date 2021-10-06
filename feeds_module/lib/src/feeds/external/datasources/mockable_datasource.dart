import 'package:dependency_module/dependency_module.dart';
import '../../data/datasources/feeds_datasource.dart';
import '../../data/models/feed_model.dart';
import '../../domain/errors/errors.dart';

class MockableDatasource implements FeedsDatasource {
  final Dio dio;

  MockableDatasource(this.dio);

  @override
  Future<List<FeedModel>> getListFeeds() async {
    final response = await dio.get("https://demo5001691.mockable.io/");

    if (response.statusCode == 200) {
      final list = (response.data['feeds'] as List)
          .map((e) => FeedModel.fromMap(e))
          .toList()
        ..sort((a, b) => b.hashdatetime.compareTo(a.hashdatetime));
      return list;
    } else {
      throw DatasourceErrorFeeds();
    }
  }
}
