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
        leading: const Icon(
          Icons.music_note,
          color: Colors.white,
        ),
        title: Text(
          trackName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          albumName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: Text(
          artistName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MusicLyricsScreen(
                    trackId: trackId,
                    trackName: trackName,
                    albumName: albumName,
                    artistName: artistName),
              ));
        },
      ),
    );
  }
}
