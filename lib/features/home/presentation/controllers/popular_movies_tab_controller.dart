import 'package:flutter/material.dart';
import 'package:themoviedb_app/core/enums/loading_state.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';
import 'package:themoviedb_app/features/home/domain/usecases/fetch_popular_movies_usecase.dart';

class PopularMoviesTabController {
  final FetchPopularMoviesUsecase _fetchPopularMoviesUsecase;

  PopularMoviesTabController(this._fetchPopularMoviesUsecase);

  final state = ValueNotifier(LoadingState.initial);

  List<MovieEntity>? movies;

  Future<void> fetchData() async {
    state.value = LoadingState.loading;
    final response = await _fetchPopularMoviesUsecase();

    response.fold((failure) {
      state.value = LoadingState.error;
    }, (response) {
      state.value = LoadingState.loaded;

      movies = response;
    });
  }
}
