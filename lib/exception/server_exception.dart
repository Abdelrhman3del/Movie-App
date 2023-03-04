import 'package:movies_app/error/exception.dart';

class ServerException implements Exception{
  ServerExceptionModel serverExceptionModel;
                 ServerException({required this.serverExceptionModel});
}