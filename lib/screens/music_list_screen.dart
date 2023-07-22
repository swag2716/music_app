import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/music_list_bloc/bloc_state.dart';
import '../bloc/music_list_bloc/music_bloc.dart';
import '../models/music_list.dart';
import '../repository/music_repository.dart';
import '../widgets/music_tile.dart';
import 'bookmark_screen.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MusicBloc(music: RepositoryProvider.of<MusicRepository>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Trending")),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookmarkScreen()));
              },
            )
          ],
        ),
        body: BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
          if (state is MusicLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MusicLoadedState) {
            MusicList musicList = state.musics;
            return ListView.builder(
                itemCount: musicList.message.body.trackList!.length,
                itemBuilder: (context, index) {
                  final trackId =
                      musicList.message.body.trackList![index].track.trackId;
                  final trackName =
                      musicList.message.body.trackList![index].track.trackName;
                  final albumName =
                      musicList.message.body.trackList![index].track.albumName;
                  final artistName =
                      musicList.message.body.trackList![index].track.artistName;
                  return MusicTile(
                      trackId: trackId,
                      trackName: trackName,
                      albumName: albumName,
                      artistName: artistName);
                });
          }

          if (state is MusicErrorState) {
            return const Center(child: Text("Error"));
          }
          return Container();
        }),
      ),
    );
  }
}
