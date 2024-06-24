// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const _path = "assets/icons";

  static const tmdbLogo = '$_path/tmdb_logo.svg';
}

extension AppIconsExt on String {
  AppIcon icon({
    String? icon,
    double? size,
    BoxFit? fit,
    Color? color,
    double? width,
    double? height,
    Function()? onTap,
  }) {
    return AppIcon(
      icon: this,
      fit: fit,
      color: color,
      width: width,
      height: height,
      onTap: onTap,
    );
  }
}

class AppIcon extends StatelessWidget {
  final String? icon;
  final BoxFit? fit;
  final Color? color;
  final double? size;
  final double? height;
  final double? width;
  final Function()? onTap;

  const AppIcon({
    super.key,
    this.icon,
    this.fit,
    this.color,
    this.size,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height ?? 20,
        width: width ?? 20,
        child: SvgPicture.asset(
          icon ?? AppIcons.tmdbLogo,
          fit: fit ?? BoxFit.contain,
          color: color,
          width: width ?? 24,
          height: height ?? 24,
        ),
      ),
    );
  }
}
