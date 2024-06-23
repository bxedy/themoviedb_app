import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:themoviedb_app/core/app_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final isSearchFieldVisible = ValueNotifier(false);

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
        body: ResponsiveGridList(
          desiredItemWidth: 100,
          minSpacing: 10,
          children: List.generate(20, (index) => index + 1).map((i) {
            return Container(
              height: 120.0,
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://via.placeholder.com/120x180",
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
        ),
      ),
    ));
  }
}
