import 'package:equatable/equatable.dart';
import '../../models/music_details.dart';
import '../../models/music_lyrics.dart';

abstract class MusicDetailsState extends Equatable {}

class MusicDetailsLoadingState extends MusicDetailsState {
  @override
  List<Object?> get props => [];
}

class MusicDetailsLoadedState extends MusicDetailsState {
  final MusicDetails music;
  final MusicLyrics musicLyric;
  MusicDetailsLoadedState(this.music, this.musicLyric);
  @override
  List<Object?> get props => [music, musicLyric];
}

class MusicDetailsErrorState extends MusicDetailsState {
  final String error;
  MusicDetailsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
