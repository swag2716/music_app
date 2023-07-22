import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:song_app/models/music_list.dart';

class Musics {
  Future<MusicList> getMusics() async {
  String apikey = dotenv.env['API_KEY'] ?? '';
  String endpoint = "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$apikey";
    final response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      return MusicList.fromJson(jsonResponse);
    } else {
      throw Exception("error");
    }
  }

}