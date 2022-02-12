
part of 'song_bloc.dart';

abstract class SongEvent extends Equatable {
  const SongEvent();

  @override
  List<Object> get props => [];
}

class GetListSongEvent extends SongEvent {
  final String command;

  GetListSongEvent({required this.command});

  @override
  List<Object> get props => [command];
}