import 'package:flutter/material.dart';
import 'dart:async';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import './loading_list_tile.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder:
              (BuildContext context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingListTile();
            }

            return buildTile(itemSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildTile(ItemModel item) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          subtitle: Text('${item.score} votes'),
          trailing: Column(
            children: <Widget>[
              Icon(Icons.comment),
              Text('${item.descendants}'),
            ],
          ),
        ),
        Divider(
          height: 8.0,
        ),
      ],
    );
  }
}
