import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/features/home/data/datasource/movies_datasource.dart';
import 'package:themoviedb_app/features/home/domain/entity/movie.dart';
import 'package:themoviedb_app/features/home/domain/repository/movies_repository.dart';

class MoviesRepositoryImp extends MoviesRepository {
  final MoviesDatasource moviesDatasource;

  MoviesRepositoryImp(this.moviesDatasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchPopular() async {
    try {
      var response = await moviesDatasource.fetchPopular();
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure.fromDioError(e));
    } on Exception {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTopRated() async {
    try {
      var response = await moviesDatasource.fetchTopRated();
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure.fromDioError(e));
    } on Exception {
      return Left(UnhandledFailure());
    }
  }
}
