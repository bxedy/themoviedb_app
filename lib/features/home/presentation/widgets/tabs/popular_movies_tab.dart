import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:themoviedb_app/core/enums/loading_state.dart';
import 'package:themoviedb_app/features/home/presentation/controllers/popular_movies_tab_controller.dart';
import 'package:themoviedb_app/shared/presentation/widgets/movie_item_widget.dart';
import 'package:themoviedb_app/shared/presentation/widgets/movies_grid_skeleton.dart';

class PopularMoviesTab extends StatefulWidget {
  const PopularMoviesTab({super.key});

  @override
  State<PopularMoviesTab> createState() => _PopularMoviesTabState();
}

class _PopularMoviesTabState extends State<PopularMoviesTab> {
  final controller = Modular.get<PopularMoviesTabController>()..fetchData();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.state,
        builder: (context, s, w) {
          return s != LoadingState.loaded
              ? const MoviesGridSkeleton()
              : ResponsiveGridList(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  desiredItemWidth: 100,
                  minSpacing: 10,
                  children: List.generate(controller.movies?.length ?? 0, (index) => index).map((i) {
                    return MovieItemWidget(movie: controller.movies![i]);
                  }).toList(),
                );
        });
  }
}
