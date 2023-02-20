import 'dart:convert';
import 'package:moviet/Model/movie_model.dart';
import 'package:moviet/Widgets/movieContainer.dart';
import 'package:moviet/api/apikey.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  String? apipath;
  MovieScreen({this.apipath});

  @override
  _MovieScreenState createState() => _MovieScreenState(apipath!!);
}

class _MovieScreenState extends State<MovieScreen> {
  String apipath;
  _MovieScreenState(this.apipath);

  String newurl() {
    print(apipath);
    return 'https://api.themoviedb.org/3/movie/top_rated?api_key=859e1e2595ca61e03a724fb8889e0ddb';
  }

  List<MovieModel> newsm = <MovieModel>[];

  Future<List<MovieModel>> getdata() async {
    final response = await http.get(Uri.parse(newurl()));
    var newsl = <MovieModel>[];
    if (response.statusCode == 200) {
      var news = json.decode(response.body);
      print(news);
      print("kkk");
      for (var newone in news['results']) {
        newsl.add(MovieModel.fromJson(newone));
      }
    }
    print(newsl);
    return newsl;
  }

  @override
  void initState() {
    getdata().then((value) {
      print(value);
      setState(() {
        newsm.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: ListView.builder(
          itemCount: newsm.length,
          itemBuilder: (BuildContext context, int index) {
            return MovieContainer(
              title: newsm[index].title,
              imageurl: newsm[index].imageurl,
              overview: newsm[index].content,
            );
          }),
    );
  }
}
