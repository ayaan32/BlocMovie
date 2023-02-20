import 'package:equatable/equatable.dart';

import '../model/albums_list.dart';

abstract class AlbumsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsLoaded extends AlbumsState {
  final Album? albums;
  AlbumsLoaded({this.albums});
}

class AlbumsListError extends AlbumsState {
  final error;
  AlbumsListError({this.error});
}
