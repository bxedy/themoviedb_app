import 'package:themoviedb_app/features/home/domain/entity/movie.dart';

abstract class MoviesDatasource {
  Future<List<MovieEntity>> fetchPopular();

  Future<List<MovieEntity>> fetchTopRated();
}
