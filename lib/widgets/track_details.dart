import 'package:flutter/material.dart';

class TrackDetails extends StatelessWidget {
  const TrackDetails({
    super.key,
    required this.trackName,
    required this.albumName,
    required this.artistName,
    required this.rating,
    required this.lyrics,
  });

  final String trackName;
  final String albumName;
  final String artistName;
  final int rating;
  final String lyrics;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Track Name:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text(trackName),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Album Name:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text(albumName),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Artist Name:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text(artistName),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Rating:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text("$rating"),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Lyrics:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text(lyrics),
          ],
        ),
      ),
    );
  }
}
