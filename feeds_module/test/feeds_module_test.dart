import 'dart:convert';

import 'package:dependency_module/dependency_module.dart';
import 'package:feeds_module/feeds_module.dart';
import 'package:feeds_module/src/feeds/domain/entities/feed.dart';
import 'package:feeds_module/src/feeds/domain/usecases/feeds_usecase.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dioMock = DioMock();

  initModule(FeedsModular(), replaceBinds: [
    Bind.instance<Dio>(dioMock),
  ]);

  test('#module: should recovery usecase without error', () {
    final usecase = Modular.get<FeedsUsecase>();
    expect(usecase, isA<FeedsUsecaseImpl>());
  });

  test('#module: should return a list of Feeds', () async {
    when(() => dioMock.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(mockableResultJson),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));

    final usecase = Modular.get<FeedsUsecase>();
    final result = await usecase();

    expect(result.getOrElse(() => []), isA<List<Feed>>());
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
