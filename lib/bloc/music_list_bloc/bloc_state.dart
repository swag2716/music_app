import 'package:equatable/equatable.dart';

abstract class MusicState extends Equatable{}

class MusicLoadingState extends MusicState{
  @override
  List<Object?> get props => [];
}