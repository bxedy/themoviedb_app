import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:themoviedb_app/features/home/presentation/widgets/movie_item_widget.dart';

class PopularMoviesTab extends StatelessWidget {
  const PopularMoviesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      desiredItemWidth: 100,
      minSpacing: 10,
      children: List.generate(30, (index) => index + 1).map((i) {
        return const MovieItemWidget();
      }).toList(),
    );
  }
}
