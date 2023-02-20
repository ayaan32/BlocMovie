import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';
import '../model/albums_list.dart';
import '../widgets/error.dart';
import '../widgets/list_row.dart';
import '../widgets/loading.dart';

class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  //
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  _loadAlbums() async {
    context.read<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumsState>(
            builder: (BuildContext context, AlbumsState state) {
          if (state is AlbumsListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTxt(
              message: message,
              onTap: _loadAlbums,
            );
          }
          if (state is AlbumsLoaded) {
            Album? albums = state.albums;
            return _list(albums!);
          }
          return Loading();
        }),
      ],
    );
  }

  Widget _list(Album albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.results?.length,
        itemBuilder: (_, index) {
          Results album = albums.results![index];
          return ListRow(album: album);
        },
      ),
    );
  }
}
