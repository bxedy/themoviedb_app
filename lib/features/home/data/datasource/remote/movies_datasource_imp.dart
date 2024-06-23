import 'package:themoviedb_app/features/home/data/datasource/movies_datasource.dart';
import 'package:themoviedb_app/features/home/domain/entity/movie.dart';

class MoviesDatasourceImp extends MoviesDatasource {
  @override
  Future<List<MovieEntity>> fetchPopular() {
    // TODO: implement fetchPopular
    throw UnimplementedError();
  }

  @override
  Future<List<MovieEntity>> fetchTopRated() {
    // TODO: implement fetchTopRated
    throw UnimplementedError();
  }
}
