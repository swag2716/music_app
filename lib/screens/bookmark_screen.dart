import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:song_app/models/bookmark_track.dart';
import '../widgets/music_tile.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  late List<String> trackIdList;
  late List<String> trackNameList;
  late List<String> trackAlbumList;
  late List<String> trackArtistList;

  @override
  void initState() {
    super.initState();
  }

  void sharedPref() async {
    final perfs = await SharedPreferences.getInstance();
    setState(() {
      trackIdList = perfs.getStringList('bookmarkList')!;
      trackNameList = perfs.getStringList('nameList')!;
      trackAlbumList = perfs.getStringList('albumList')!;
      trackAlbumList = perfs.getStringList('artistList')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    sharedPref();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Bookmarks',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: (trackIdList.isEmpty)
          ? const Center(
              child: Text(
                'No bookmarks added',
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
            )
          : listViewBuilder(),
    );
  }

  listViewBuilder() {
    return ListView.builder(
        itemBuilder: (context, index) {
          BookmarkTrack track = BookmarkTrack();
          track.trackId = int.parse(trackIdList[index]);
          track.trackName = trackNameList[index];
          track.albumName = trackAlbumList[index];
          track.artistName = trackAlbumList[index];
          return MusicTile(
              trackId: track.trackId!,
              trackName: track.trackName!,
              albumName: track.albumName!,
              artistName: track.artistName!);
        },
        itemCount: trackIdList.length);
  }
}
