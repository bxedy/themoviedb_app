import 'package:dartz/dartz.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/features/home/domain/repository/movies_repository.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

abstract class FetchPopularMoviesUsecase {
  Future<Either<Failure, List<MovieEntity>>> call();
}

class FetchPopularMoviesUsecaseImp implements FetchPopularMoviesUsecase {
  final HomeRepository _repository;

  FetchPopularMoviesUsecaseImp(this._repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await _repository.fetchPopularMovies();
  }
}
