import 'package:get_it/get_it.dart';
import 'package:music_app/core/util/itunes.dart';
import 'package:music_app/core/util/playerController.dart';
import 'package:music_app/feature/music/data/datasources/song_data_source.dart';
import 'package:music_app/feature/music/domain/repositories/song_repository.dart';
import 'package:music_app/feature/music/domain/usecases/get_song.dart';
import 'package:music_app/feature/music/presentation/blocs/song_bloc.dart';

import 'feature/music/data/repositories/song_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<SongBloc>(
        () => SongBloc(sl())
  );

  sl.registerSingleton<ITunes>(ITunes());

  sl.registerSingleton<PlayerController>(PlayerController());

  // Use cases
  sl.registerLazySingleton(() => GetSong(repository: sl()));

  // Repository
  sl.registerLazySingleton<SongRepository>(() => SongRepositoryImpl(songDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<SongDataSource>(() => SongDataSourceImpl());

}