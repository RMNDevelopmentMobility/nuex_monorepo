import '../models/feed_model.dart';

abstract class FeedsDatasource {
  Future<List<FeedModel>> getListFeeds();
}
