import 'package:dependency_module/dependency_module.dart';
import 'package:feeds_module/src/feeds/data/datasources/feeds_datasource.dart';
import 'package:feeds_module/src/feeds/data/models/feed_model.dart';
import 'package:feeds_module/src/feeds/data/repositories/feeds_repository_impl.dart';
import 'package:feeds_module/src/feeds/domain/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';

class FeedsDatasourceMock extends Mock implements FeedsDatasource {}

void main() {
  final datasource = FeedsDatasourceMock();
  final repository = FeedsRepositoryImpl(datasource);

  test('#feeds repository impl: should return a list of Feeds', () async {
    when(datasource.getListFeeds).thenAnswer((_) async => <FeedModel>[]);

    final result = await repository.getFeeds();

    expect(result, isA<Right>());
    expect(result.fold(id, id), isA<List<FeedModel>>());
  });

  test('#feeds repository impl: should return a DatasourceErrorFeeds on error',
      () async {
    when(datasource.getListFeeds).thenThrow(Exception());

    final result = await repository.getFeeds();

    expect(result, isA<Left>());
    expect(result.fold(id, id), isA<DatasourceErrorFeeds>());
  });
}
