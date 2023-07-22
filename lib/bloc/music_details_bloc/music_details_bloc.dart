import 'package:bloc/bloc.dart';
import 'package:song_app/bloc/music_details_bloc/bloc_event.dart';
import 'package:song_app/bloc/music_details_bloc/bloc_state.dart';
import '../../repository/music_repository.dart';

class MusicDetailsBloc extends Bloc<MusicDetailsEvent, MusicDetailsState> {
  final MusicRepository musicRespository;
  final int trackId;

  MusicDetailsBloc({required this.musicRespository, required this.trackId})
      : super(MusicDetailsLoadingState()) {
    on<LoadMusicDetailsAndLyricsEvent>((event, emit) async {
      emit(MusicDetailsLoadingState());
      try {
        final music = await musicRespository.getMusic(event.trackId);
        final musicLyric = await musicRespository.getLyrics(event.trackId);
        emit(MusicDetailsLoadedState(music, musicLyric));
      } catch (e) {
        emit(MusicDetailsErrorState(e.toString()));
      }
    });
    add(LoadMusicDetailsAndLyricsEvent(trackId));
  }
}
