import 'dart:convert';

import 'package:music_app/core/errors/exceptions.dart';
import 'package:music_app/core/util/url.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/feature/music/data/model/song_model.dart';

abstract class SongDataSource {
  Future<List<SongModel>> getSong(String str);
}

class SongDataSourceImpl extends SongDataSource {

  List<SongModel> list = [];

  @override
  Future<List<SongModel>> getSong(String src) async {
    String urlEndPoint = searchUrl(src);
    await getAllSong(urlEndPoint);
    return list;
  }

  Future<void> getAllSong(String url) async {
    final Map<String, String> headers = {"Content-type": "application/json","accept" : "application/json"};
    try{
    final response = await http.get(
        Uri.parse(url),
        headers: headers,
      ).timeout(Duration(seconds: 20),
        onTimeout: () {
          return http.Response('Error', 500); 
        },
      );
      if (response.statusCode == 200) {
        
        final res = jsonDecode(response.body);
        final resSong = res['results'];
        print(res['resultCount']);
        print(resSong);
        list.clear();
        for (var i in resSong) {
          list.add(SongModel.fromMap(i));
        }

      } else {
        print('e is error');
        throw ServerException();
      }
    } catch (e) {
      print('e is $e');
      throw ServerException();
    }

  }
}
