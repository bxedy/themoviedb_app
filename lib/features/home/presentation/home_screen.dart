import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:themoviedb_app/core/app_gradients.dart';
import 'package:themoviedb_app/core/app_icons.dart';
import 'package:themoviedb_app/core/widgets/gradient_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final isSearchFieldVisible = ValueNotifier(false);
  late TabController _tabController;

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
      child: NestedScrollView(
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
                  onPressed: () {},
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      height: 36,
                      width: MediaQuery.sizeOf(context).width * 0.6,
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
                  [
                    const Center(
                      child: Text(
                        'Tendências',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ResponsiveGridList(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      desiredItemWidth: 100,
                      minSpacing: 10,
                      children: List.generate(30, (index) => index + 1).map((i) {
                        return Container(
                          height: 160,
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        "https://via.placeholder.com/150x225",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Movie Title $i',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  ][_tabController.index],
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
