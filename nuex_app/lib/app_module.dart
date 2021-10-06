import 'package:dependency_module/dependency_module.dart';
import 'package:feeds_module/feeds_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: FeedsModular()),
      ];
}
