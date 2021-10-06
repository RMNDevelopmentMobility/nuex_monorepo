import 'package:dependency_module/dependency_module.dart';
import '../data/repositories/feeds_repository_impl.dart';
import '../domain/usecases/feeds_usecase.dart';
import '../external/datasources/mockable_datasource.dart';
import 'feeds_router.dart';

class FeedsModular extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => FeedsUsecaseImpl(i())),
    Bind((i) => FeedsRepositoryImpl(i())),
    Bind((i) => MockableDatasource(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const FeedsRouter()),
  ];
}
