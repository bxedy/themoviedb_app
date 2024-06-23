import 'package:themoviedb_app/core/app_client.dart';
import 'package:themoviedb_app/features/home/data/datasource/movies_datasource.dart';
import 'package:themoviedb_app/features/home/data/models/movie.dart';
import 'package:themoviedb_app/features/home/domain/entity/movie.dart';

class MoviesDatasourceImp extends MoviesDatasource {
  final AppClient client;

  MoviesDatasourceImp(this.client);

  @override
  Future<List<MovieEntity>> fetchPopular() async {
    final response = await client.get('popular?language=pt&page=1&api_key=9954ebe4ea9762d280b6c8b0eb35c7ac');

    return response.data['results'].map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieEntity>> fetchTopRated() async {
    final response = await client.get('top_rated?language=pt&page=1&api_key=9954ebe4ea9762d280b6c8b0eb35c7ac');

    return response.data['results'].map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
    
  }
}
