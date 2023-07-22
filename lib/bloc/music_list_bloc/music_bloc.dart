import 'package:bloc/bloc.dart';
import 'package:song_app/bloc/music_list_bloc/bloc_event.dart';
import 'package:song_app/bloc/music_list_bloc/bloc_state.dart';

import '../../controllers/get_musics.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final Musics _music;

  MusicBloc(this._music) : super(MusicLoadingState()) {
    on<LoadMusicEvent>((event, emit) async {
      emit(MusicLoadingState());
      try{
        final musics = await _music.getMusics();
        emit(MusicLoadedState(musics));
      } catch(e){
        print(e);
        emit(MusicErrorState(e.toString()));
      }
      
    });
  }
}