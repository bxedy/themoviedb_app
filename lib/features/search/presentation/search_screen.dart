import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:themoviedb_app/core/app_icons.dart';
import 'package:themoviedb_app/core/enums/loading_state.dart';
import 'package:themoviedb_app/features/home/presentation/widgets/movie_item_widget.dart';
import 'package:themoviedb_app/features/search/presentation/search_controller.dart';
import 'package:themoviedb_app/shared/presentation/widgets/movies_grid_skeleton.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = Modular.get<SearchController>();
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xff032541),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppIcons.tmdbLogo.icon(
                fit: BoxFit.fitWidth,
              ),
            ),
            leadingWidth: 200,
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.search),
              ),
              hintText: 'Buscar por um Filme, Série ou Pessoa',
              hintStyle: TextStyle(color: Colors.grey.shade400),
            ),
          ),
          ListenableBuilder(
              listenable: Listenable.merge([searchController.state, textEditingController]),
              builder: (context, s) {
                return SingleChildScrollView(
                  child: searchController.state.value != LoadingState.loaded && textEditingController.text.isNotEmpty
                      ? const MoviesGridSkeleton()
                      : ResponsiveGridList(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          desiredItemWidth: 100,
                          minSpacing: 10,
                          children: List.generate(searchController.movies?.length ?? 0, (index) => index).map((i) {
                            return MovieItemWidget(movie: searchController.movies![i]);
                          }).toList(),
                        ),
                );
              })
        ],
      ),
    );
  }
}
