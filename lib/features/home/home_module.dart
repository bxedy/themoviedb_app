import 'package:flutter_modular/flutter_modular.dart';
import 'package:themoviedb_app/core/app_client.dart';
import 'package:themoviedb_app/core/app_routes.dart';
import 'package:themoviedb_app/features/home/data/datasource/movies_datasource.dart';
import 'package:themoviedb_app/features/home/data/datasource/remote/movies_datasource_imp.dart';
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
    Bind.factory<MoviesDatasource>(
      (i) => MoviesDatasourceImp(
        i.get<AppClient>(),
      ),
    ),
    //Repository
    Bind.factory<MoviesRepository>(
      (i) => MoviesRepositoryImp(
        i.get<MoviesDatasource>(),
      ),
    ),
    //Usecases
    Bind.factory<FetchTopRatedMoviesUsecase>(
      (i) => FetchTopRatedMoviesUsecaseImp(
        i.get<MoviesRepository>(),
      ),
    ),
    Bind.factory<FetchPopularMoviesUsecase>(
      (i) => FetchPopularMoviesUsecaseImp(
        i.get<MoviesRepository>(),
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
