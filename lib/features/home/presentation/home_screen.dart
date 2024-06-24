import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themoviedb_app/core/app_gradients.dart';
import 'package:themoviedb_app/core/app_icons.dart';
import 'package:themoviedb_app/core/app_routes.dart';
import 'package:themoviedb_app/core/widgets/gradient_text.dart';
import 'package:themoviedb_app/features/home/presentation/widgets/tabs/popular_movies_tab.dart';
import 'package:themoviedb_app/features/home/presentation/widgets/tabs/top_rated_movies_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final ValueNotifier isSearchFieldVisible = ValueNotifier(false);
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      child: ValueListenableBuilder(
          valueListenable: isSearchFieldVisible,
          builder: (context, s, _) {
            return NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: const Color(0xff032541),
                    floating: true,
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AppIcons.tmdbLogo.icon(
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    leadingWidth: 200,
                    actions: [
                      IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        onPressed: () {
                          Modular.to.pushNamed(AppRoutes.search);
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ];
              },
              body: AnimatedBuilder(
                animation: _tabController,
                builder: (context, _) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            height: 32,
                            width: 200,
                            child: TabBar(
                              splashBorderRadius: BorderRadius.circular(25.0),
                              controller: _tabController,
                              isScrollable: false,
                              indicatorPadding: EdgeInsets.zero,
                              labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              dividerColor: Colors.transparent,
                              tabs: [
                                Tab(
                                  child: GradientText(
                                    'Tendências',
                                    gradient: _tabController.index == 0 ? AppGradients.g1 : null,
                                  ),
                                ),
                                Tab(
                                  child: GradientText(
                                    'Populares',
                                    gradient: _tabController.index == 1 ? AppGradients.g1 : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        [const TopRatedMoviesTab(), const PopularMoviesTab()][_tabController.index],
                        const SizedBox(height: 24),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
    ));
  }
}
