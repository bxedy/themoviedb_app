import 'package:themoviedb_app/shared/domain/entity/movie.dart';

abstract class SearchDatasource {
  Future<List<MovieEntity>> searchMovies(String query);
}
