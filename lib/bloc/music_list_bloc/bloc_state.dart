import 'package:equatable/equatable.dart';
import 'package:song_app/models/music_list.dart';

abstract class MusicState extends Equatable{}

class MusicLoadingState extends MusicState{
  @override
  List<Object?> get props => [];
}
class MusicLoadedState extends MusicState{
  final MusicList musics;
  MusicLoadedState(this.musics);
  @override
  List<Object?> get props => [musics];
}

class MusicErrorState extends MusicState{
  final String error;
  MusicErrorState(this.error);
  @override
  List<Object?> get props => [error];
}