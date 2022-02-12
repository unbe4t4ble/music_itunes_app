import 'package:flutter/material.dart';
import 'package:music_app/feature/music/data/model/song_model.dart';

class ITunes extends ChangeNotifier{

  SongModel? currentTrack;

  // Fetches the next song from list. Prefetched by the AudioPlayer widget
  SongModel? fetchNext(List<SongModel> songList){
    int currentIndex = songList.indexOf(currentTrack!);

    if(currentIndex==-1 || currentIndex==songList.length-1) return null;

    return songList[currentIndex+1];
  }

  // Fetches the previous song from list. Prefetched by the AudioPlayer widget
  SongModel? fetchPrev(List<SongModel> songList){
    int currentIndex = songList.indexOf(currentTrack!);
    if(currentIndex==-1 || currentIndex==0) return null;

    return songList[currentIndex-1];
  }

}