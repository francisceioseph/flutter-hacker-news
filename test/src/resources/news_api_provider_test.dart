import 'package:news/src/resources/news_api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final newsApi = NewsApiProvider();

    newsApi.client = MockClient((Request request) async {
      final ids = [1, 2, 3, 4, 5, 6];
      final data = json.encode(ids);

      return Response(data, 200);
    });

    final ids = await newsApi.fetchTopIds();
    expect(ids, [1, 2, 3, 4, 5, 6]);
  });

  test('FetchItem returns a item model', () async {
    final newsApi = NewsApiProvider();

    newsApi.client = MockClient((Request request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(123);

    expect(item.id, 123);
  });
}
