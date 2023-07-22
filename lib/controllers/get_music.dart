import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:song_app/models/music_details.dart';

class Music {
  Future<MusicDetails> getMusic(int trackId) async {
  String apikey = dotenv.env['API_KEY'] ?? '';
  String endpoint = "https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=$apikey";
    final response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      return MusicDetails.fromJson(jsonResponse);
    } else {
      throw Exception("error");
    }
  }

}