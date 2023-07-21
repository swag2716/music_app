import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/music_blocs/music_bloc.dart';
import '../bloc/music_list_bloc/bloc_event.dart';
import '../bloc/music_list_bloc/bloc_state.dart';
import '../controllers/get_music.dart';

class MusicListScreen extends StatelessWidget{
  const MusicListScreen({super.key});

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context) => MusicBloc(
        RepositoryProvider.of<Music>(context)
      )..add(LoadMusicEvent()),

      child: Scaffold(
          appBar: AppBar(
            title: const Text("Music App"),
          ),
          body: BlocBuilder<MusicBloc, MusicState>(
            builder: (context, state) {
              if (state is MusicLoadingState) {
                return const Center(child: CircularProgressIndicator(),);
              }
              return Container();
            }
            ),
        ),
    );
  }
  
}