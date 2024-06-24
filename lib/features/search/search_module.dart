import 'package:flutter_modular/flutter_modular.dart';
import 'package:themoviedb_app/core/app_client.dart';
import 'package:themoviedb_app/core/app_routes.dart';
import 'package:themoviedb_app/features/search/data/datasource/remote/search_datasource_imp.dart';
import 'package:themoviedb_app/features/search/data/datasource/search_datasource.dart';
import 'package:themoviedb_app/features/search/data/repository/search_repository_imp.dart';
import 'package:themoviedb_app/features/search/domain/repository/search_repository.dart';
import 'package:themoviedb_app/features/search/domain/usecases/search_movies_usecase.dart';
import 'package:themoviedb_app/features/search/presentation/search_controller.dart';
import 'package:themoviedb_app/features/search/presentation/search_screen.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<SearchController>(
      (i) => SearchController(
        i.get<SearchUsecase>(),
      ),
    ),
    //Datasources
    Bind.factory<SearchDatasource>(
      (i) => SearchDatasourceImp(
        i.get<AppClient>(),
      ),
    ),
    //Repository
    Bind.factory<SearchRepository>(
      (i) => SearchRepositoryImp(
        i.get<SearchDatasource>(),
      ),
    ),
    //Usecases
    Bind.factory<SearchUsecase>(
      (i) => SearchUsecaseImp(
        i.get<SearchRepository>(),
      ),
    ),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.search,
          child: (_, args) => const SearchScreen(),
        ),
      ];
}
