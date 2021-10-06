import 'dart:convert';

import 'package:dependency_module/dependency_module.dart';
import 'package:feeds_module/src/feeds/domain/errors/errors.dart';
import 'package:feeds_module/src/feeds/external/datasources/mockable_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = MockableDatasource(dio);

  test('#mockable datasource: should return a list of Feeds', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: jsonDecode(mockableResultJson),
          statusCode: 200,
        ));

    final future = datasource.getListFeeds();
    expect(future, completes);
  });

  test('#mockable datasource: should return a DatasourceErrorFeeds on error',
      () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: jsonDecode(mockableResultJson),
          statusCode: 401,
        ));

    final future = datasource.getListFeeds();
    expect(future, throwsA(isA<DatasourceErrorFeeds>()));
  });
}

const mockableResultJson = """ 
{
  "feeds": [
    {
      "hashdatetime": "2021-09-26 08:00:00",
      "type": "welcome",
      "title": "Bem vindo ao Nubank",
      "subtitle": "Nubank!"
    },
    {
      "hashdatetime": "2021-09-26 08:30:00",
      "type": "card_unlock",
      "title": "Seu cartão está desbloqueado!",
      "subtitle": "Desbloqueado"
    },
    {
      "hashdatetime": "2021-09-26 08:45:00",
      "type": "credit_purchase",
      "title": "O’Hara",
      "subtitle": "08:45",
      "totalvalue": 1300.00,
      "subdivision": "em 12x"
    },
    {
      "hashdatetime": "2021-09-26 09:15:00",
      "type": "credit_purchase",
      "title": "Williamson",
      "subtitle": "09:15",
      "totalvalue": 725.00
    },
    {
      "hashdatetime": "2021-09-26 10:55:00",
      "type": "credit_purchase",
      "title": "Wolf",
      "subtitle": "10:55",
      "totalvalue": 122.40
    },
    {
      "hashdatetime": "2021-09-26 21:00:00",
      "type": "invoice_closed",
      "title": "Fatura fechada",
      "subtitle": "Vence em 26/07 e hoje é o melhor dia pra compras"
    }
  ]
}
""";
