import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:themoviedb_app/core/widgets/shimmer_widget.dart';

class MoviesGridSkeleton extends StatelessWidget {
  const MoviesGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      desiredItemWidth: 100,
      minSpacing: 10,
      children: List.generate(20, (index) => index).map((i) {
        return _MovieItemWidgetSkeleton();
      }).toList(),
    );
  }
}

class _MovieItemWidgetSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            const ShimmerWidget.rectangular(height: 160),
            Positioned(
              bottom: -16,
              left: 14,
              child: Stack(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF081C22),
                    ),
                    child: const ShimmerWidget.rectangular(height: 10, width: 50),
                  ),
                  const SizedBox(
                    width: 36,
                    height: 36,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: CircularProgressIndicator(
                        value: 0,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: ShimmerWidget.rectangular(height: 16, width: 50),
        ),
      ],
    );
  }
}
