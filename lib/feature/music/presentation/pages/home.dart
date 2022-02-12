import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/util/playerController.dart';
import 'package:music_app/feature/music/presentation/blocs/song_bloc.dart';
import 'package:music_app/feature/music/presentation/pages/search.dart';
import 'package:music_app/feature/music/presentation/pages/player.dart';
import 'package:music_app/feature/music/presentation/pages/songList.dart';
import 'package:music_app/injector_container.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with WidgetsBindingObserver{

  final playerController = sl<PlayerController>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed){
      playerController.controller!.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
          title: ArtistSearchBox(),
        ),
          
      body: BlocBuilder<SongBloc, SongState>(
        builder: (BuildContext context, SongState state) {
          if(state is SongInitialState){
            return Container();
          }else if (state is SongLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SongLoadSuccessState) {
            return ChangeNotifierProvider.value(
              value: playerController,
              child: Consumer<PlayerController>(
                builder: (context, _, child){
                  return Column(
                    children: [
                      SongListWidget(songList: state.songList,),
                      if(playerController.controller!=null)AudioPlayer(songList: state.songList,)
                    ],
                  );
                },
              ),
            );
          } else if (state is SongLoadFailedState) {
              return Center(
                child: Text("Error Loading"),
              );
            } else {
              return Center(
                child: Text("Unexpected State"),
              );
            }
        },
      ),
    );
  }
}
