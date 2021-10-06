import 'package:dependency_module/dependency_module.dart';
import '../entities/feed.dart';
import '../errors/errors.dart';

abstract class FeedsRepository {
  Future<Either<FailureFeeds, List<Feed>>> getFeeds();
}
