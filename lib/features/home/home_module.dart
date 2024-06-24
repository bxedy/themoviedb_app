import 'package:flutter_modular/flutter_modular.dart';
import 'package:themoviedb_app/core/app_client.dart';
import 'package:themoviedb_app/core/app_routes.dart';
import 'package:themoviedb_app/features/home/data/datasource/home_datasource.dart';
import 'package:themoviedb_app/features/home/data/datasource/remote/home_datasource_imp.dart';
import 'package:themoviedb_app/features/home/data/repository/movies_repository_imp.dart';
import 'package:themoviedb_app/features/home/domain/repository/movies_repository.dart';
import 'package:themoviedb_app/features/home/domain/usecases/fetch_popular_movies_usecase.dart';
import 'package:themoviedb_app/features/home/domain/usecases/fetch_top_rated_movies_usecase.dart';
import 'package:themoviedb_app/features/home/presentation/controllers/popular_movies_tab_controller.dart';
import 'package:themoviedb_app/features/home/presentation/controllers/top_rated_movies_tab_controller.dart';
import 'package:themoviedb_app/features/home/presentation/home_screen.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<TopRatedMoviesTabController>(
      (i) => TopRatedMoviesTabController(
        i.get<FetchTopRatedMoviesUsecase>(),
      ),
    ),
    Bind.factory<PopularMoviesTabController>(
      (i) => PopularMoviesTabController(
        i.get<FetchPopularMoviesUsecase>(),
      ),
    ),
    //Datasources
    Bind.factory<HomeDatasource>(
      (i) => HomeDatasourceImp(
        i.get<AppClient>(),
      ),
    ),
    //Repository
    Bind.factory<HomeRepository>(
      (i) => HomeRepositoryImp(
        i.get<HomeDatasource>(),
      ),
    ),
    //Usecases
    Bind.factory<FetchTopRatedMoviesUsecase>(
      (i) => FetchTopRatedMoviesUsecaseImp(
        i.get<HomeRepository>(),
      ),
    ),
    Bind.factory<FetchPopularMoviesUsecase>(
      (i) => FetchPopularMoviesUsecaseImp(
        i.get<HomeRepository>(),
      ),
    ),
  ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.home,
          child: (_, args) => const HomeScreen(),
        ),
      ];
}
