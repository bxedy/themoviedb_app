import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shapeBorder;
  final Color? baseColor;
  final Color highlightColor;
  final double size;
  final double borderRadius;

  const ShimmerWidget.rectangular({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.baseColor = const Color.fromARGB(255, 223, 223, 223),
    this.highlightColor = Colors.grey,
    this.borderRadius = 14,
  })  : shapeBorder = BoxShape.rectangle,
        size = height;

  const ShimmerWidget.circular({
    super.key,
    required this.size,
    this.baseColor = const Color.fromARGB(255, 223, 223, 223),
    this.highlightColor = Colors.grey,
  })  : shapeBorder = BoxShape.circle,
        width = size,
        height = size,
        borderRadius = 0;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.2),
        highlightColor: Colors.grey.withOpacity(0.4),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: baseColor,
            shape: shapeBorder,
            borderRadius: shapeBorder == BoxShape.circle ? null : BorderRadius.circular(borderRadius),
          ),
        ),
      );
}
