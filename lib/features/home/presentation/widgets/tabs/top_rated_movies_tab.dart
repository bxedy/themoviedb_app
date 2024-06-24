import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:themoviedb_app/core/enums/loading_state.dart';
import 'package:themoviedb_app/features/home/presentation/controllers/top_rated_movies_tab_controller.dart';
import 'package:themoviedb_app/features/home/presentation/widgets/movie_item_widget.dart';
import 'package:themoviedb_app/shared/presentation/widgets/movies_grid_skeleton.dart';

class TopRatedMoviesTab extends StatefulWidget {
  const TopRatedMoviesTab({super.key});

  @override
  State<TopRatedMoviesTab> createState() => _TopRatedMoviesTabState();
}

class _TopRatedMoviesTabState extends State<TopRatedMoviesTab> {
  final controller = Modular.get<TopRatedMoviesTabController>()..fetchData();

  @override
  void dispose() {
    super.dispose();
  }

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
