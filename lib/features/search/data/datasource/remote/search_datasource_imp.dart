import 'package:themoviedb_app/core/app_client.dart';
import 'package:themoviedb_app/features/search/data/datasource/search_datasource.dart';
import 'package:themoviedb_app/shared/data/models/movie.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

class SearchDatasourceImp extends SearchDatasource {
  final AppClient client;

  SearchDatasourceImp(this.client);

  @override
  Future<List<MovieEntity>> searchMovies(String query) async {
    final response = await client.get('search/tv?api_key=9954ebe4ea9762d280b6c8b0eb35c7ac&query=$query');

    return response.data['results'].map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
  }
}
