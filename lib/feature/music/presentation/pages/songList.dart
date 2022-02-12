
import 'package:flutter/material.dart';
import 'package:music_app/feature/music/data/model/song_model.dart';
import 'package:music_app/feature/music/presentation/pages/songTile.dart';


class SongListWidget extends StatelessWidget{

  final List<SongModel> songList;

  const SongListWidget({required this.songList}); 

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Container(
        child: songList.length > 0 ?
        ListView(
          children: songList.map((song) => SongTileWidget(song)).toList(),
        ) :
        Center(
          child: Text("Not Found"),
        ),
      ),
    );
  }
}