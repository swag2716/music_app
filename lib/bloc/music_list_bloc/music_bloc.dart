import 'package:bloc/bloc.dart';
import 'package:song_app/bloc/music_list_bloc/bloc_event.dart';
import 'package:song_app/bloc/music_list_bloc/bloc_state.dart';
import '../../repository/music_repository.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final MusicRepository music;

  MusicBloc({required this.music}) : super(MusicLoadingState()) {
    on<LoadMusicEvent>((event, emit) async {
      emit(MusicLoadingState());
      try {
        final musics = await music.getMusics();
        emit(MusicLoadedState(musics));
      } catch (e) {
        emit(MusicErrorState(e.toString()));
      }
    });
    add(LoadMusicEvent());
  }
}
