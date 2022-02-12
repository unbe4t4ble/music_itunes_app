import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/feature/music/data/model/atm_model.dart';
import 'package:music_app/feature/music/domain/usecases/get_song.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {

  SongBloc(this.getAllSong) : super(SongInitialState(songList: [])); 

  late String result = "123";
  final GetSong getAllSong;

  @override
  Stream<SongState> mapEventToState(SongEvent event) async* {
    if (event is GetListSongEvent) {
      String command =  event.command.trim();
      command = command.replaceAll(" ", "+");

      yield SongLoadingState();
      final songListFailedOrSuccess = await getAllSong(SongParams(str: command));
      yield songListFailedOrSuccess.fold(
        (l) => SongLoadFailedState(),
        (r) => SongLoadSuccessState(songList: r),
      );
    }
  }

}