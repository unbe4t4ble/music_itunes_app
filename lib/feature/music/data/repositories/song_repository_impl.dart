import 'package:dartz/dartz.dart';
import 'package:music_app/core/data/base_repository.dart';
import 'package:music_app/core/errors/exceptions.dart';
import 'package:music_app/core/errors/failures.dart';
import 'package:music_app/feature/music/data/datasources/song_data_source.dart';
import 'package:music_app/feature/music/data/model/song_model.dart';
import 'package:music_app/feature/music/domain/repositories/song_repository.dart';

class SongRepositoryImpl extends BaseRepositoryImpl implements SongRepository {
  final SongDataSource songDataSource;

  SongRepositoryImpl({
    required this.songDataSource,
  }) : super();

  @override
  Future<Either<Failure, List<SongModel>>> getSong(String str) async {
    return await checkNetwork<List<SongModel>>(() async {
        try {
          final songModel = await songDataSource.getSong(str);
          return Right(songModel);
        } on ServerException catch (e) {
          print('e is $e');
          return Left(ServerFailure());
        }
      },
    );
  }

}
