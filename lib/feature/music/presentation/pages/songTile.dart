import 'package:flutter/material.dart';
import 'package:music_app/core/util/itunes.dart';
import 'package:music_app/feature/music/data/model/song_model.dart';
import 'package:music_app/injector_container.dart';

class SongTileWidget extends StatelessWidget{
  final SongModel song;
  
  final ITunes itunes = sl<ITunes>();

  SongTileWidget(this.song);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListTile(
        onTap: (){
          song.play();
        },
        title: Text(song.trackName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(song.artistName),
            Text(song.collectionName,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),)
          ]
        ),
        leading: Container(
          width: 60,
          height: 60,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    song.artworkUrl)
            )
        )),
        trailing: itunes.currentTrack==song ? Icon(Icons.graphic_eq):null,
        isThreeLine: true,
      ),
    );
  }
}