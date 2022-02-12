part of 'song_bloc.dart';

abstract class SongState extends Equatable {
  const SongState();

  @override
  List<Object> get props => [];
}

class SongInitialState extends SongState {
  final List<SongModel> songList;

  SongInitialState({required this.songList});

  @override
  List<Object> get props => [];
}

class SongLoadingState extends SongState {}

class SongLoadSuccessState extends SongState {
  final List<SongModel> songList;

  SongLoadSuccessState({required this.songList});

  @override
  List<Object> get props => [];
}

class SongLoadFailedState extends SongState {}