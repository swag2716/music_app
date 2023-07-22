import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MusicDetailsEvent extends Equatable {
  const MusicDetailsEvent();
}

class LoadMusicDetailsAndLyricsEvent extends MusicDetailsEvent {
  final int trackId;

  const LoadMusicDetailsAndLyricsEvent(this.trackId);
  @override
  List<Object?> get props => [trackId];
}
