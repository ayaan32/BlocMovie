import 'dart:io';
import 'package:album/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/exceptions.dart';
import '../api/services.dart';
import '../model/albums_list.dart';
import 'events.dart';

class AlbumsBloc extends Bloc<AlbumEvents, AlbumsState> {
  final AlbumsRepo? albumsRepo;
  AlbumServices albumServices = AlbumServices();
  Album? albums;
  AlbumsBloc({this.albumsRepo}) : super(AlbumsInitState());
  @override
  Stream<AlbumsState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albums = await albumServices.getAlbumList();
          yield AlbumsLoaded(albums: albums);
        } on SocketException {
          yield AlbumsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AlbumsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AlbumsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield AlbumsListError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}
