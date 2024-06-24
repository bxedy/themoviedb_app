import 'package:dartz/dartz.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/features/search/domain/repository/search_repository.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

abstract class SearchUsecase {
  Future<Either<Failure, List<MovieEntity>>> call(String query);
}

class SearchUsecaseImp implements SearchUsecase {
  final SearchRepository _repository;

  SearchUsecaseImp(this._repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(String query) async {
    return await _repository.searchMovies(query);
  }
}
