import 'package:flutter_modular/flutter_modular.dart';
import 'package:themoviedb_app/core/app_client.dart';
import 'package:themoviedb_app/features/home/home_module.dart';
import 'package:themoviedb_app/features/search/search_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<AppClient>((i) => AppClient()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ModuleRoute(Modular.initialRoute, module: SearchModule()),
      ];
}
