import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import '../models/music_lyrics.dart';

class MusicLyric {
  Future<MusicLyrics> getLyrics(int trackId) async {
  String apikey = dotenv.env['API_KEY'] ?? '';
  String endpoint = "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=$apikey";
    final response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      return MusicLyrics.fromJson(jsonResponse);
    } else {
      throw Exception("error");
    }
  }

}