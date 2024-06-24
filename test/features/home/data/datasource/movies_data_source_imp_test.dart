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
  late MockMoviesDatasource mockMoviesDatasource;

  setUp(() {
    mockMoviesDatasource = MockMoviesDatasource();
    repository = HomeRepositoryImp(mockMoviesDatasource);
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
      when(mockMoviesDatasource.fetchPopularMovies()).thenAnswer((_) async => tMovies);

      final result = await repository.fetchPopularMovies();

      expect(result, Right(tMovies));
      verify(mockMoviesDatasource.fetchPopularMovies());
      verifyNoMoreInteractions(mockMoviesDatasource);
    });

   test('should return a Failure when the call to datasource is unsuccessful', () async {

      when(await mockMoviesDatasource.fetchPopularMovies()).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
        ),
      ));

      expectLater(
        () async => await repository.fetchPopularMovies(),
        throwsA(isA<Failure>()),
      );

      verify(mockMoviesDatasource.fetchPopularMovies());
      verifyNoMoreInteractions(mockMoviesDatasource);
    });
  });

  group('fetchTopRated', () {
    test('should return list of movies when the call to datasource is successful', () async {

      when(mockMoviesDatasource.fetchTopRatedMovies()).thenAnswer((_) async => tMovies);

      final result = await repository.fetchTopRatedMovies();

      expect(result, Right(tMovies));
      verify(mockMoviesDatasource.fetchTopRatedMovies());
      verifyNoMoreInteractions(mockMoviesDatasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful', () async {

      when(mockMoviesDatasource.fetchTopRatedMovies()).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 500,
        ),
      ));

      expect(
        () async => await repository.fetchTopRatedMovies(),
        throwsA(isA<InternalErrorFailure>()),
      );

      verify(mockMoviesDatasource.fetchTopRatedMovies());
      verifyNoMoreInteractions(mockMoviesDatasource);
    });
  });
}
