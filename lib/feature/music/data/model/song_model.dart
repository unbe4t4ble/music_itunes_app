import 'package:flutter/material.dart';
import 'package:music_app/core/util/itunes.dart';
import 'package:music_app/core/util/playerController.dart';
import 'package:music_app/feature/music/domain/entities/song.dart';
import 'package:music_app/injector_container.dart';

// ignore: must_be_immutable
class SongModel extends Song with ChangeNotifier{

  final String trackUrl;
  final String artworkUrl;
  final String trackName;
  final String artistName;
  final String collectionName;

  SongModel({
    required this.trackUrl,
    required this.artworkUrl,
    required this.trackName,
    required this.artistName,
    required this.collectionName,
  }) : super (trackUrl: trackUrl, artworkUrl: artworkUrl, trackName: trackName, artistName: artistName, collectionName: collectionName);

  factory SongModel.fromMap(Map<String, dynamic> json) =>
      new SongModel(
        trackUrl: json["previewUrl"],
        artworkUrl: json["artworkUrl60"],
        trackName: json["trackName"],
        artistName: json["artistName"],
        collectionName: json["collectionName"],
      );

  play(){
    final playerController = sl<PlayerController>();
    final itunes = sl<ITunes>();
    playerController.setTrack(trackUrl);
    itunes.currentTrack = this;
    notifyListeners();
  }

}