// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/features/search/presentation/pages/search.dart';

import '../config/theme/palette.dart';
import '../features/home/presentation/pages/home.dart';
import '../widgets/app_text.dart';

final bottomNavIndexProvider = StateProvider((index) => 2);

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final currentIndex = ref.watch(bottomNavIndexProvider);

        return Stack(
          children: [
            IndexedStack(index: currentIndex, children: const [
              SearchPage(),
              SizedBox(
                child: Center(child: AppText("Chat")),
              ),
              HomePage(),
              SizedBox(
                child: Center(child: AppText("Favourites")),
              ),
              SizedBox(
                child: Center(child: AppText("Account")),
              ),
            ]),
            const Positioned(
                bottom: 30.0, right: 20, left: 20, child: AppBottomNavBar())
          ],
        );
      }),
    );
  }
}

class AppBottomNavBar extends StatelessWidget {
  final VoidCallback? onTap;
  const AppBottomNavBar({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Consumer(builder: (context, ref, child) {
        return Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(34.0)),
              child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                    child: Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34.0)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NavButton(
                                    index: 0,
                                    child: SvgPicture.asset(
                                        "assets/icons/search.svg",
                                        height: 24.0,
                                        color: Palette.offwhite)),
                                NavButton(
                                    index: 1,
                                    child: SvgPicture.asset(
                                        "assets/icons/chat.svg",
                                        height: 24.0,
                                        color: Palette.offwhite)),
                                NavButton(
                                    index: 2,
                                    child: SvgPicture.asset(
                                        "assets/icons/home.svg",
                                        height: 24.0,
                                        color: Palette.offwhite)),
                                NavButton(
                                    index: 3,
                                    child: SvgPicture.asset(
                                        "assets/icons/heart.svg",
                                        height: 24.0,
                                        color: Palette.offwhite)),
                                NavButton(
                                    index: 4,
                                    child: SvgPicture.asset(
                                        "assets/icons/user.svg",
                                        height: 24.0,
                                        color: Palette.offwhite)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        );
      }),
    );
  }
}

class NavButton extends ConsumerWidget {
  final Widget child;
  final bool isActive;
  final int index;
  final VoidCallback? onTap;
  const NavButton(
      {required this.child,
      required this.index,
      this.isActive = false,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
          color: currentIndex == index ? Palette.primary : Palette.black,
          shape: BoxShape.circle),
      child: IconButton(
          splashRadius: 26.0,
          iconSize: 32,
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  currentIndex == index ? Colors.transparent : Palette.black),
          onPressed: () {
            ref
                .read(bottomNavIndexProvider.notifier)
                .update((index) => this.index);
          },
          icon: child),
    );
  }
}
