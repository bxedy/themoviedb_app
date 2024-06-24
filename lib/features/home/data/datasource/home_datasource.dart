import 'package:themoviedb_app/shared/domain/entity/movie.dart';

abstract class HomeDatasource {
  Future<List<MovieEntity>> fetchPopularMovies();

  Future<List<MovieEntity>> fetchTopRatedMovies();
}
