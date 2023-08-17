class CacheException implements Exception {}
class ServerException implements Exception {
  static invalidResponse() {}

  static operationFailed() {}

  static connectionFailed() {}
}