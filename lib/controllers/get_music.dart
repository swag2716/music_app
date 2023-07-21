import 'dart:convert';

import 'package:http/http.dart';
import 'package:song_app/models/music_list.dart';

class Music {
  String endpoint = "https://api.musixmatch.com/ws/1.1/";
  Future <List<MusicList>> getMusics() async {
    final response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      final List result = jsonDecode(response.body);
      return result.map((e) => MusicList.fromJson(e)).toList();
    } else {
      throw Exception("error");
    }
  }

}