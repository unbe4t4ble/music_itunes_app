import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Song extends Equatable{

  final String trackUrl;
  final String artworkUrl;
  final String trackName;
  final String artistName;
  final String collectionName;

  Song({
    required this.trackUrl, 
    required this.artworkUrl, 
    required this.trackName, 
    required this.artistName, 
    required this.collectionName
  });

  @override
  List<Object> get props => [trackUrl, artworkUrl, trackName, artistName, collectionName];

}