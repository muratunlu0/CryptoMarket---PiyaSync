// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:piyasync_mvp/repository/repository.dart';
import 'package:piyasync_mvp/repository/repository_sector.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  const path1 =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';

  const path2 =
      'https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest';

  test('Fetch data from Path1', () async {
    dioAdapter
      ..onGet(
        path1,
        (request) =>
            request.reply(200, {'message': 'Successfully mocked GET Path1!'}),
      );

    final onGetResponse1 = await dio.get(path1);
    print(onGetResponse1.data); // {message: Successfully mocked GET Path1!}
    expect(onGetResponse1.data['message'], 'Successfully mocked GET Path1!');
  });

  test('Fetch data from Path2', () async {
    dioAdapter
      ..onGet(
        path2,
        (request) =>
            request.reply(200, {'message': 'Successfully mocked GET Path2!'}),
      );
    dio.options.queryParameters = {
      "symbol": "POWR,EWT,WOZX,GRID,SNC,ELEC,TSL,EVDC,LITH,ROX"
    }; //energy coins
    final onGetResponse2 = await dio.get(path2);
    print(onGetResponse2.data); // {message: Successfully mocked GET Path2!}
    expect(onGetResponse2.data['message'], 'Successfully mocked GET Path2!');
  });
}
