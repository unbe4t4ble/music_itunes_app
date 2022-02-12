
import 'package:flutter/material.dart';
import 'package:music_app/core/util/itunes.dart';
import 'package:music_app/core/util/playerController.dart';
import 'package:music_app/feature/music/data/model/song_model.dart';
import 'package:music_app/injector_container.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';


class AudioPlayer extends StatelessWidget{

  final List<SongModel> songList;

  const AudioPlayer({required this.songList}); 

  @override
  Widget build(BuildContext context) {
    final playerController = sl<PlayerController>();
    final itunes= sl<ITunes>();
    final nextSong = itunes.fetchNext(songList);
    final prevSong = itunes.fetchPrev(songList);
    
    return ChangeNotifierProvider.value(
      value: playerController,
      child: Consumer<PlayerController>(
        builder: (context, _, child){
          final _controller = playerController.controller;
          return Container(
            color: Colors.blueGrey,
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: prevSong!=null? prevSong.play : null
                ),
                IconButton(
                    icon: Icon(
                      _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      _controller.value.isPlaying
                          ? playerController.pause()
                          : playerController.play();
                    }
                ),
                IconButton(
                    icon: Icon(Icons.skip_next),
                    onPressed: nextSong!=null? nextSong.play: null
                ),
                Visibility(
                  visible: false,
                    child: VideoPlayer(_controller)
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
