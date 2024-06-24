import 'package:flutter/material.dart';
import 'package:themoviedb_app/core/enums/loading_state.dart';
import 'package:themoviedb_app/features/search/domain/usecases/search_movies_usecase.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

class SearchController {
  final SearchUsecase _searchUsecase;

  SearchController(this._searchUsecase);

  final state = ValueNotifier(LoadingState.initial);

  List<MovieEntity>? movies;

  Future<void> fetchData() async {
    state.value = LoadingState.loading;
    // final response = await _fetchPopularMoviesUsecase();
//
    // response.fold((failure) {
    //   state.value = LoadingState.error;
    // }, (response) {
    //   state.value = LoadingState.loaded;
//
    //   movies = response;
    // });
  }
}
