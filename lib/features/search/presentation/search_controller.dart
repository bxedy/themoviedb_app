import 'package:flutter/material.dart';
import 'package:themoviedb_app/core/app_debouncer.dart';
import 'package:themoviedb_app/core/enums/loading_state.dart';
import 'package:themoviedb_app/features/search/domain/usecases/search_movies_usecase.dart';
import 'package:themoviedb_app/shared/domain/entity/movie.dart';

class SearchController {
  final SearchUsecase _searchUsecase;

  SearchController(this._searchUsecase);

  final state = ValueNotifier(LoadingState.initial);

  final AppDebouncer _debouncer = AppDebouncer(const Duration(seconds: 1));

  List<MovieEntity>? movies;

  Future<void> fetchData() async {
    state.value = LoadingState.loading;
  }

  Future<void> search(String search) async {
    _debouncer.cancel();

    _debouncer.run(() async {
      state.value = LoadingState.loading;

      final response = await _searchUsecase(search);

      response.fold(
        (failure) {
          state.value = LoadingState.error;
        },
        (response) {
          movies = response;
          state.value = LoadingState.loaded;
        },
      );
    });
  }

  void undoSearch() async {
    movies = [];
    state.value = LoadingState.initial;
  }
}
