import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:song_app/bloc/music_details_bloc/bloc_event.dart';
import 'package:song_app/bloc/music_details_bloc/bloc_state.dart';
import 'package:song_app/bloc/music_details_bloc/music_details_bloc.dart';
import 'package:song_app/controllers/get_lyrics.dart';

import '../controllers/get_music.dart';
import '../models/music_details.dart';
import '../models/music_lyrics.dart';

class MusicLyricsScreen extends StatefulWidget{
  final int trackId;
  final String trackName;
  final String albumName;
  final String artistName;

  const MusicLyricsScreen({
    super.key, 
    required this.trackId,
    required this.trackName,
    required this.albumName,
    required this.artistName,
    });

  @override
  State<MusicLyricsScreen> createState() => _MusicLyricsScreenState();
}

class _MusicLyricsScreenState extends State<MusicLyricsScreen> {
  IconData bookmarkIcon = Icons.bookmark_border;
  bool changed = false;
  void checkBookmarkStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList('bookmarkList') ?? [];
    setState(() {
      if (stringList.contains(widget.trackId.toString())) {
        bookmarkIcon = Icons.bookmark;
      } else {
        bookmarkIcon = Icons.bookmark_border;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkBookmarkStatus();
  }
  Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicDetailsBloc(
        music: RepositoryProvider.of<Music>(context),
        musicLyric: RepositoryProvider.of<MusicLyric>(context)
      )..add(LoadMusicDetailsAndLyricsEvent(widget.trackId)),

      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lyrics"),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
          icon: Icon(
            bookmarkIcon,
            color: Colors.black,
          ),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final trackIDList = prefs.getStringList('bookmarkList') ?? [];
            final trackNameList = prefs.getStringList('nameList') ?? [];
            final trackAlbumList = prefs.getStringList('albumList') ?? [];
            final trackArtistList = prefs.getStringList('artistList') ?? [];
            setState(() {
              changed = true;
              if (bookmarkIcon == Icons.bookmark_border) {
                bookmarkIcon = Icons.bookmark;
                 trackIDList.add(widget.trackId.toString());
                trackNameList.add(widget.trackName);
                trackAlbumList.add(widget.albumName);
                trackArtistList.add(widget.artistName);
              } else {
                bookmarkIcon = Icons.bookmark_border;
                if (prefs.containsKey('bookmarkList') &&
                    trackIDList.contains(widget.trackId.toString())) {
                  int index =
                      trackIDList.indexOf(widget.trackId.toString());
                  trackIDList.removeAt(index);
                  trackNameList.removeAt(index);
                  trackAlbumList.removeAt(index);
                  trackArtistList.removeAt(index);
                }
              }
              prefs.setStringList('bookmarkList', trackIDList);
              prefs.setStringList('nameList', trackNameList);
              prefs.setStringList('albumList', trackAlbumList);
              prefs.setStringList('artistList', trackArtistList);
            });
            //print(trackIDList.toString());
            //print(trackNameList.toString());
            //print(trackAlbumList.toString());
            //print(trackArtistList.toString());
          },
        )
          ],
        ),
        body: BlocBuilder<MusicDetailsBloc, MusicDetailsState>(
          builder: (context, state){
            if(state is MusicDetailsLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is MusicDetailsLoadedState){
              MusicDetails musicDetail = state.music;
              MusicLyrics musicLyrics = state.musicLyric;
              final trackName = musicDetail.message.body.track.trackName;
              final albumName = musicDetail.message.body.track.albumName;
              final artistName = musicDetail.message.body.track.artistName;
              final rating = musicDetail.message.body.track.trackRating;
              final lyrics = musicLyrics.message.body.lyrics.lyricsBody;

              return SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Track Name:", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20
                      ),),
                      Text(trackName),
                      const SizedBox(height: 10,),
                      const Text("Album Name:", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20
                      ),),
                      Text(albumName),
                      const SizedBox(height: 10,),
                      const Text("Artist Name:", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20
                      ),),
                      Text(artistName),
                      const SizedBox(height: 10,),
                      const Text("Rating:", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20
                      ),),
                      Text("$rating"),
                      const SizedBox(height: 10,),
                      const Text("Lyrics:", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20
                      ),),
                      Text(lyrics),
                    ],
                  ),
                ),
              );

            }

            return Container();
          }
        ),
      ),
    );
  }
}