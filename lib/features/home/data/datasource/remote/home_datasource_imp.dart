import 'package:themoviedb_app/core/app_client.dart';
import 'package:themoviedb_app/features/home/data/datasource/home_datasource.dart';
import 'package:themoviedb_app/shared/data/models/movie.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

class HomeDatasourceImp extends HomeDatasource {
  final AppClient client;

  HomeDatasourceImp(this.client);

  @override
  Future<List<MovieEntity>> fetchPopularMovies() async {
    final response = await client.get('/movie/popular?language=pt&page=1&api_key=9954ebe4ea9762d280b6c8b0eb35c7ac');

    return response.data['results'].map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieEntity>> fetchTopRatedMovies() async {
    final response = await client.get('/movie/top_rated?language=pt&page=1&api_key=9954ebe4ea9762d280b6c8b0eb35c7ac');

    return response.data['results'].map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
    
  }
}
