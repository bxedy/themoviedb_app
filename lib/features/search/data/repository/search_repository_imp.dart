import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/features/search/data/datasource/search_datasource.dart';
import 'package:themoviedb_app/features/search/domain/repository/search_repository.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

class SearchRepositoryImp extends SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImp(this.datasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query) async {
    try {
      var response = await datasource.searchMovies(query);
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure.fromDioError(e));
    } on Exception {
      return Left(UnhandledFailure());
    }
  }
}
