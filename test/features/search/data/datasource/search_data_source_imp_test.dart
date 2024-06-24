import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:themoviedb_app/core/failures/failures.dart';

import 'package:themoviedb_app/features/search/data/datasource/search_datasource.dart';
import 'package:themoviedb_app/features/search/data/repository/search_repository_imp.dart';
import 'package:themoviedb_app/shared/data/models/movie.dart';

import 'search_data_source_imp_test.mocks.dart';

@GenerateMocks([SearchDatasource])
void main() {
  late SearchRepositoryImp repository;
  late MockSearchDatasource mockSearchDatasource;

  setUp(() {
    mockSearchDatasource = MockSearchDatasource();
    repository = SearchRepositoryImp(mockSearchDatasource);
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

  group('fetchSearch', () {
    test('should return list of movies when the call to datasource is successful', () async {
      when(mockSearchDatasource.searchMovies('')).thenAnswer((_) async => tMovies);

      final result = await repository.searchMovies('');

      expect(result, Right(tMovies));
      verify(mockSearchDatasource.searchMovies(''));
      verifyNoMoreInteractions(mockSearchDatasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful', () async {
      when(await mockSearchDatasource.searchMovies('')).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
        ),
      ));

      final result = await repository.searchMovies('');

      expect(result, isA<Left>());
      result.leftMap((l) => expect(l, isA<AuthenticationFailed>()));
    });
  });
}
