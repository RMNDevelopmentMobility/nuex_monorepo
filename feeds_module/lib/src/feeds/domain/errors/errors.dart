abstract class FailureFeeds implements Exception {}

class ExceptionFeeds implements FailureFeeds {}

class DatasourceErrorFeeds implements FailureFeeds {}
