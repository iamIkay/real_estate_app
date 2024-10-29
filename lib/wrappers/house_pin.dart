// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/config/theme/palette.dart';
import 'package:real_estate_app/widgets/app_text.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HousePin extends StatefulWidget {
  const HousePin({super.key});

  @override
  State<HousePin> createState() => _HousePinState();
}

class _HousePinState extends State<HousePin>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 100.0, end: 40.0).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (visibility) async {
        await Future.delayed(const Duration(milliseconds: 600), () {
          _controller!.forward();
        });
      },
      child: AnimatedBuilder(
          animation: _animation!,
          builder: (context, child) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 40.0,
                width: _animation!.value,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: Palette.primary),
                child: _animation!.value == 40.0
                    ? SvgPicture.asset("assets/icons/building.svg",
                        height: 18.0, color: Colors.white)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 700),
                              opacity: _animation?.value == 100 ? 1 : 0,
                              child: AppText(
                                "N ${(Random().nextDouble() * 256).toStringAsFixed(2)} m",
                                align: TextAlign.center,
                                maxLines: 1,
                                color: Colors.white,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            );
          }),
    );
  }
}
