import 'package:dartz/dartz.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query);

}
