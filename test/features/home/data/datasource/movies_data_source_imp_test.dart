import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/features/home/data/datasource/home_datasource.dart';
import 'package:themoviedb_app/features/home/data/repository/movies_repository_imp.dart';
import 'package:themoviedb_app/shared/data/models/movie.dart';

import 'movies_data_source_imp_test.mocks.dart';


@GenerateMocks([HomeDatasource])
void main() {
  late HomeRepositoryImp repository;
  late MockHomeDatasource mockHomeDatasource;

  setUp(() {
    mockHomeDatasource = MockHomeDatasource();
    repository = HomeRepositoryImp(mockHomeDatasource);
  });

  final tMovies = [
    MovieModel(
      adult: true,
      backdropPath: 'backdrop.jpg',
      genreIds: [1, 2, 3],
      id: 123,
      originalLanguage: 'en',
      originalTitle: 'Original Title',
      overview: 'Movie Overview',
      popularity: 123.45,
      posterPath: 'poster.jpg',
      releaseDate: '2022-01-01',
      title: 'Movie Title',
      video: false,
      voteAverage: 7.5,
      voteCount: 100,
    )
  ];

  group('fetchPopular', () {
    test('should return list of movies when the call to datasource is successful', () async {
      when(mockHomeDatasource.fetchPopularMovies()).thenAnswer((_) async => tMovies);

      final result = await repository.fetchPopularMovies();

      expect(result, Right(tMovies));
      verify(mockHomeDatasource.fetchPopularMovies());
      verifyNoMoreInteractions(mockHomeDatasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful', () async {
      when(mockHomeDatasource.fetchPopularMovies()).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
        ),
      ));

      final result = await repository.fetchPopularMovies();

      expect(result, isA<Left>());
      result.leftMap((l) => expect(l, isA<AuthenticationFailed>()));
    });
  });

  group('fetchTopRated', () {
    test('should return list of movies when the call to datasource is successful', () async {
      when(mockHomeDatasource.fetchTopRatedMovies()).thenAnswer((_) async => tMovies);

      final result = await repository.fetchTopRatedMovies();

      expect(result, Right(tMovies));
      verify(mockHomeDatasource.fetchTopRatedMovies());
      verifyNoMoreInteractions(mockHomeDatasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful', () async {
      when(mockHomeDatasource.fetchTopRatedMovies()).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
        ),
      ));

      final result = await repository.fetchTopRatedMovies();

      expect(result, isA<Left>());
      result.leftMap((l) => expect(l, isA<AuthenticationFailed>()));
    });
  });
}
