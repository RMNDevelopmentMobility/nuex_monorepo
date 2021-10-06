import 'package:feeds_module/src/feeds/domain/entities/feed.dart';
import 'package:feeds_module/src/feeds/domain/usecases/feeds_usecase.dart';
import 'package:flutter/material.dart';

abstract class IFeedsController extends ChangeNotifier {
  bool get isLoading;
  bool get hasError;
  String get error;
  Future<void> fetchList();
  List<Feed> get list;
}

class FeedsController extends ChangeNotifier implements IFeedsController {
  final FeedsUsecase usecase;

  //final Future<void> Function(String) onError;

  FeedsController({
    required this.usecase,
    /*required this.onError,*/
  });

  bool _isLoading = false;

  List<Feed> _list = [];

  String _error = '';

  void _setIsLoading({bool value = false}) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError({String value = ''}) {
    _error = value;
    notifyListeners();
  }

  @override
  String get error => _error;

  @override
  Future<void> fetchList() async {
    try {
      _setError(value: '');
      _setIsLoading(value: true);

      //_list = await usecase.call;

      final result = await usecase();
      result.fold((l) => (l), (r) => _list = r);
    } on Exception catch (e) {
      _setError(value: e.toString());
      //onError(e.toString());
    } finally {
      _setIsLoading();
    }
  }

  @override
  bool get hasError => _error.isNotEmpty;

  @override
  bool get isLoading => _isLoading;

  @override
  List<Feed> get list => _list;
}
