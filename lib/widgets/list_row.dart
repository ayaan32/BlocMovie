import 'package:flutter/material.dart';

import '../model/albums_list.dart';

class ListRow extends StatelessWidget {
  final Results? album;
  ListRow({this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${album?.title}'),
          Text(
            album?.title ?? "Default",
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
