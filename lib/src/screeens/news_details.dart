import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail({this.itemId});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Text('Hi');
  }
}
