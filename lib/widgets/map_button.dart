import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/config/theme/palette.dart';

class MapButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const MapButton(this.child, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(26.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: IconButton(
                iconSize: 32,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.grey.withOpacity(0.7)),
                onPressed: () {
                  if (onTap != null) {
                    onTap!();
                  }
                },
                icon: child),
          ),
        ),
      ],
    );
  }
}
