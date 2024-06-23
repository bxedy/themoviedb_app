import 'package:dartz/dartz.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/features/home/domain/entity/movie.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> fetchPopular();

  Future<Either<Failure, List<MovieEntity>>> fetchTopRated();
}
