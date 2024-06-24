import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:themoviedb_app/core/failures/failures.dart';
import 'package:themoviedb_app/features/home/data/datasource/movies_datasource.dart';
import 'package:themoviedb_app/features/home/data/models/movie.dart';
import 'package:themoviedb_app/features/home/data/repository/movies_repository_imp.dart';

import 'movies_data_source_imp_test.mocks.dart';

@GenerateMocks([MoviesDatasource])
void main() {
  late MoviesRepositoryImp repository;
  late MockMoviesDatasource mockMoviesDatasource;

  setUp(() {
    mockMoviesDatasource = MockMoviesDatasource();
    repository = MoviesRepositoryImp(mockMoviesDatasource);
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
      when(mockMoviesDatasource.fetchPopular()).thenAnswer((_) async => tMovies);

      final result = await repository.fetchPopular();

      expect(result, Right(tMovies));
      verify(mockMoviesDatasource.fetchPopular());
      verifyNoMoreInteractions(mockMoviesDatasource);
    });

   test('should return a Failure when the call to datasource is unsuccessful', () async {

      when(await mockMoviesDatasource.fetchPopular()).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
        ),
      ));

      expect(
        () async => await repository.fetchPopular(),
        throwsA(isA<Failure>()),
      );

      verify(mockMoviesDatasource.fetchPopular());
      verifyNoMoreInteractions(mockMoviesDatasource);
    });
  });

  group('fetchTopRated', () {
    test('should return list of movies when the call to datasource is successful', () async {

      when(mockMoviesDatasource.fetchTopRated()).thenAnswer((_) async => tMovies);

      final result = await repository.fetchTopRated();

      expect(result, Right(tMovies));
      verify(mockMoviesDatasource.fetchTopRated());
      verifyNoMoreInteractions(mockMoviesDatasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful', () async {

      when(mockMoviesDatasource.fetchTopRated()).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 500,
        ),
      ));

      expect(
        () async => await repository.fetchTopRated(),
        throwsA(isA<InternalErrorFailure>()),
      );

      verify(mockMoviesDatasource.fetchTopRated());
      verifyNoMoreInteractions(mockMoviesDatasource);
    });
  });
}
