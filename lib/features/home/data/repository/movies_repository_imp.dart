import 'package:dartz/dartz.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/features/home/domain/entity/movie.dart';
import 'package:themoviedb_app/features/home/domain/repository/movies_repository.dart';

class MoviesRepositoryImp extends MoviesRepository {
  @override
  Future<Either<Failure, List<MovieEntity>>> fetchPopular() {
    // TODO: implement fetchPopular
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTopRated() {
    // TODO: implement fetchTopRated
    throw UnimplementedError();
  }
}
