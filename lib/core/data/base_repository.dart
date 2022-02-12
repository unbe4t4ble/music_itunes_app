import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:music_app/core/errors/failures.dart';

typedef FutureEitherOr<T> = Future<Either<Failure, T>> Function();
typedef FutureEitherOrWithToken<T> = Future<Either<Failure, T>> Function(
    String token);

abstract class BaseRepository {
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body);
}

class BaseRepositoryImpl implements BaseRepository {

  bool isConnected = false;
  BaseRepositoryImpl();

  @override
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body) async {
    await onCheckInternet();
    if (isConnected) {
      return body();
    } else {
      return Left(ServerFailure());
    }
  }

  Future<void> onCheckInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        isConnected = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      isConnected = false;
    }
  }
}
