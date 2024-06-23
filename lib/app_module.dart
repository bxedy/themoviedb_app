import 'package:flutter_modular/flutter_modular.dart';
import 'package:themoviedb_app/features/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Bind.lazySingleton<RestClient>((i) => DioRestClient()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}
