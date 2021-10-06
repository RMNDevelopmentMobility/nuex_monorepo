import 'package:dependency_module/dependency_module.dart';
import '../entities/feed.dart';
import '../errors/errors.dart';
import '../repositories/feeds_repository.dart';

abstract class FeedsUsecase {
  Future<Either<FailureFeeds, List<Feed>>> call();
}

class FeedsUsecaseImpl implements FeedsUsecase {
  final FeedsRepository repository;

  FeedsUsecaseImpl(this.repository);

  @override
  Future<Either<FailureFeeds, List<Feed>>> call() async {
    final result = await repository.getFeeds();

    if (result.isLeft()) {
      return Left(ExceptionFeeds());
    }

    return result;
  }
}
