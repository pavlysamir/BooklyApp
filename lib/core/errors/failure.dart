import 'package:dio/dio.dart';

abstract class Failuer {
  final String messege;

  Failuer(this.messege);
}

class ServerFailuer extends Failuer {
  ServerFailuer(super.messege);

  // ignore: deprecated_member_use
  factory ServerFailuer.fromDioErrors(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer('connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailuer('send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailuer('receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailuer('bad Certificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailuer.fromRespond(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.cancel:
        return ServerFailuer('canceled with api server');
      case DioExceptionType.connectionError:
        return ServerFailuer('no internet connection');
      case DioExceptionType.unknown:
        return ServerFailuer('there was error ,please try later');
    }
  }
  factory ServerFailuer.fromRespond(int? statusCode, dynamic respond) {
    if (statusCode == 404) {
      return ServerFailuer('Your Resquest was not Found ,please try later');
    } else if (statusCode == 500) {
      return ServerFailuer('there is a problem with server ,please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(respond['error']['message']);
    } else {
      return ServerFailuer('There was error ,please try later');
    }
  }
}
