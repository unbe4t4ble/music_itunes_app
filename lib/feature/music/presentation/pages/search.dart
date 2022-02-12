import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/feature/music/presentation/blocs/song_bloc.dart';

class ArtistSearchBox extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    controllerListener(context);

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          hintText: 'Search Artist',
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
          suffixIcon: IconButton(
            onPressed: controller.clear,
            icon: Icon(Icons.clear),
          ),
        ),
      ),
    );
  }

  controllerListener(BuildContext context) {
    
    controller.addListener(() {
      String token = controller.text.trim();
      Future.delayed(Duration(milliseconds: 500), () async {
        if (token == controller.text.trim() && token.length > 2) {
          try {
            BlocProvider.of<SongBloc>(context).add(
              GetListSongEvent(
                command: token,
              ),
            );
          } catch (e) {
            print(e);
          }
        }
      });
    });
  }
}
