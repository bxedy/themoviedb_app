import 'package:dartz/dartz.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies();

  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies();
}
