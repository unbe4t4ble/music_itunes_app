import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/core/errors/failures.dart';
import 'package:music_app/core/usecases/usecase.dart';
import 'package:music_app/feature/music/data/model/song_model.dart';
import 'package:music_app/feature/music/domain/entities/song.dart';
import 'package:music_app/feature/music/domain/repositories/song_repository.dart';

class GetSong extends UseCase<List<Song>, SongParams> {
  final SongRepository repository;

  GetSong({required this.repository});

  @override
  Future<Either<Failure, List<SongModel>>> call(params) async {
    return await repository.getSong(params.str);
  }
}

class SongParams extends Equatable {
  final String str;
  SongParams({
    required this.str,
  });

  @override
  List<Object> get props => [str];
}
