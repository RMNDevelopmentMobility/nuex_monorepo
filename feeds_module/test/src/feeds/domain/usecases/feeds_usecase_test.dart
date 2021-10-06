import 'package:dependency_module/dependency_module.dart';
import 'package:feeds_module/src/feeds/domain/entities/feed.dart';
import 'package:feeds_module/src/feeds/domain/errors/errors.dart';
import 'package:feeds_module/src/feeds/domain/repositories/feeds_repository.dart';
import 'package:feeds_module/src/feeds/domain/usecases/feeds_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

class FeedsRepositoryMock extends Mock implements FeedsRepository {}

void main() {
  final repository = FeedsRepositoryMock();
  final usecase = FeedsUsecaseImpl(repository);

  test('#feeds usecase: should return a list of Feeds', () async {
    when(repository.getFeeds).thenAnswer((_) async => const Right(<Feed>[]));

    final result = await usecase();

    expect(result, isA<Right>());
    expect(result.fold(id, id), isA<List<Feed>>());
  });

  test('#feeds usecase: should return a ExceptionFeeds on error', () async {
    when(repository.getFeeds).thenAnswer((_) async => Left(ExceptionFeeds()));

    final result = await usecase();

    expect(result, isA<Left>());
    expect(result.fold(id, id), isA<ExceptionFeeds>());
  });
}
