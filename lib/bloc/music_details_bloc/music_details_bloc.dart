import 'package:bloc/bloc.dart';
import 'package:song_app/bloc/music_details_bloc/bloc_event.dart';
import 'package:song_app/bloc/music_details_bloc/bloc_state.dart';
import 'package:song_app/controllers/get_lyrics.dart';


import '../../controllers/get_music.dart';

class MusicDetailsBloc extends Bloc<MusicDetailsEvent, MusicDetailsState> {
  final Music _music;
  final MusicLyric _musicLyric;

  MusicDetailsBloc({required Music music, required MusicLyric musicLyric}) : 
  _music = music, 
  _musicLyric = musicLyric,
  super(MusicDetailsLoadingState()) {
    on<LoadMusicDetailsAndLyricsEvent>((event, emit) async {
      emit(MusicDetailsLoadingState());
      try{
        final music = await _music.getMusic(event.trackId);
        final musicLyric = await _musicLyric.getLyrics(event.trackId);
        emit(MusicDetailsLoadedState(music, musicLyric));
      } catch(e){
        emit(MusicDetailsErrorState(e.toString()));
      }
      
    });
  }
}