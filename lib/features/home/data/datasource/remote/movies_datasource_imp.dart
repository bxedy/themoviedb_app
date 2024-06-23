import 'package:dio/dio.dart';
import 'package:themoviedb_app/features/home/data/datasource/movies_datasource.dart';
import 'package:themoviedb_app/features/home/data/models/movie.dart';
import 'package:themoviedb_app/features/home/domain/entity/movie.dart';

class MoviesDatasourceImp extends MoviesDatasource {
  @override
  Future<List<MovieEntity>> fetchPopular() async {
    final response = await Dio()
        .get('https://api.themoviedb.org/3/movie/popular?language=pt&page=1&api_key=9954ebe4ea9762d280b6c8b0eb35c7ac');

    return response.data['results'].map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieEntity>> fetchTopRated() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/top_rated?language=pt&page=1&api_key=9954ebe4ea9762d280b6c8b0eb35c7ac');

    return response.data['results'].map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
  }
}
