import 'package:dartz/dartz.dart';
import 'package:music_app/core/data/base_repository.dart';
import 'package:music_app/core/errors/failures.dart';
import 'package:music_app/feature/music/data/model/atm_model.dart';

abstract class SongRepository extends BaseRepository {
  Future<Either<Failure, List<SongModel>>> getSong(String str);
}
