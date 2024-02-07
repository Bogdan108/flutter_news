import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionCheker;
  NetworkInfoImpl({required this.connectionCheker});
  @override
  Future<bool> get isConnected => connectionCheker.hasConnection;
}
