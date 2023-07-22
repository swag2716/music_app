import 'package:flutter/material.dart';
import '../screens/music_lyrics_screen.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({
    super.key,
    required this.trackId,
    required this.trackName,
    required this.albumName,
    required this.artistName,

  });

  final int trackId;
  final String trackName;
  final String albumName;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListTile(
        title: Text(trackName, style: const TextStyle(
          color: Colors.black
        ),),
        subtitle: Text(albumName),
        onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MusicLyricsScreen(trackId: trackId, trackName: trackName, albumName: albumName, artistName: artistName),
              )
            );                     
            
          },
      ),
    );
  }
}