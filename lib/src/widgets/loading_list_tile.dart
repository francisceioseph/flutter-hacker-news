import 'package:flutter/material.dart';

class LoadingListTile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: buildBox(),
          subtitle: buildBox(rightMargin: 40.0),
        ),
        Divider(
          height: 8.0,
        ),
      ],
    );
  }

  Widget buildBox({double rightMargin: 0}) {
    return Container(
      color: Colors.grey[400],
      height: 14.0,
      width: 115.0,
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: rightMargin),
    );
  }
}
