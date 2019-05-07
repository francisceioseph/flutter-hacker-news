import 'package:flutter/material.dart';
import 'blocs/stories_provider.dart';
import 'blocs/comments_provider.dart';
import 'screeens/news_list.dart';
import 'screeens/news_details.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'News!',
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return NewsList();
        },
      );
    }

    return MaterialPageRoute(
      builder: (BuildContext context) {
        final itemId = int.parse(settings.name.replaceFirst('/', ''));
        final bloc = CommentsProvider.of(context);

        bloc.fetchItemWithComments(itemId);
        return NewsDetail(itemId: itemId);
      },
    );
  }
}
