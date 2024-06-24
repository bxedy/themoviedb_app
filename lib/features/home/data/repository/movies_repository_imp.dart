import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/features/home/data/datasource/home_datasource.dart';
import 'package:themoviedb_app/features/home/domain/repository/movies_repository.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeDatasource moviesDatasource;

  HomeRepositoryImp(this.moviesDatasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies() async {
    try {
      var response = await moviesDatasource.fetchPopularMovies();
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure.fromDioError(e));
    } on Exception {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies() async {
    try {
      var response = await moviesDatasource.fetchTopRatedMovies();
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure.fromDioError(e));
    } on Exception {
      return Left(UnhandledFailure());
    }
  }
}
