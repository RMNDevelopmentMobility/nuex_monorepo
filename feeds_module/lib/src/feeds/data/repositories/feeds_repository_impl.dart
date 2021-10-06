import 'package:dependency_module/dependency_module.dart';
import '../../domain/repositories/feeds_repository.dart';
import '../datasources/feeds_datasource.dart';
import '../../domain/errors/errors.dart';
import '../../domain/entities/feed.dart';

class FeedsRepositoryImpl implements FeedsRepository {
  final FeedsDatasource datasource;

  FeedsRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureFeeds, List<Feed>>> getFeeds() async {
    try {
      final result = await datasource.getListFeeds();
      return Right(result);
    } catch (e) {
      return Left(DatasourceErrorFeeds());
    }
  }
}
