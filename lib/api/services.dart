import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/albums_list.dart';

abstract class AlbumsRepo {
  Future<Album> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  //
  static const _baseUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=859e1e2595ca61e03a724fb8889e0ddb';
  //static const String _GET_ALBUMS = '/results';
  @override
  Future<Album> getAlbumList() async {
    Uri uri = Uri.parse(_baseUrl);
    Response response = await http.get(uri);
    print(response.body);
    Album albums = Album.fromJson(json.decode(response.body));
    return albums;
  }
}
