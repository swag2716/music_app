import 'package:bloc/bloc.dart';
import 'package:song_app/bloc/music_list_bloc/bloc_event.dart';
import 'package:song_app/bloc/music_list_bloc/bloc_state.dart';

import '../../controllers/get_music.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final Music _music;

  MusicBloc(this._music) : super(MusicLoadingState()) {
    on<LoadMusicEvent>((event, emit) async {
      emit(MusicLoadingState());
    });
  }
}