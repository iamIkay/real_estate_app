import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../config/theme/palette.dart';
import '../../../../widgets/app_text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        // Shrinkable top content
        SliverAppBar(
          expandedHeight: MediaQuery.sizeOf(context).height * 0.6,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            background: AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Palette.gradient.withOpacity(0.6)]),
              ),
              alignment: Alignment.center,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 8.0),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 30.0,
                                  color: Colors.grey.withOpacity(0.09),
                                  offset: const Offset(-1, -1)),
                              BoxShadow(
                                  // blurStyle: BlurStyle.inner,
                                  blurRadius: 30.0,
                                  color: Colors.grey.withOpacity(0.09),
                                  offset: const Offset(0, 1))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Iconsax.location5,
                                  size: 18.0, color: Palette.secondary),
                              const SizedBox(width: 5.0),
                              AppText("Saint Petersburg",
                                  color: Palette.secondary,
                                  weight: FontWeight.w600,
                                  size: 14.0)
                            ],
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 24.0,
                        backgroundImage: AssetImage("assets/avi.jpeg"),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  AppText("Hi, John",
                      size: 26.0,
                      color: Palette.secondary,
                      weight: FontWeight.w500),
                  AppText("let's select your",
                      size: 32.0,
                      weight: FontWeight.w500,
                      color: Palette.black),
                  AppText("perfect place",
                      size: 32.0,
                      weight: FontWeight.w500,
                      color: Palette.black),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.symmetric(vertical: 25.0),
                            decoration: BoxDecoration(
                                color: Palette.primary, shape: BoxShape.circle),
                            child: Column(
                              children: [
                                const AppText("BUY",
                                    size: 14, color: Colors.white),
                                const SizedBox(height: 20.0),
                                Countup(
                                  begin: 800,
                                  end: 1034,
                                  duration: const Duration(seconds: 4),
                                  separator: ' ',
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                const AppText("offers",
                                    size: 10.0, color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(width: 6.0),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [Palette.offwhite, Colors.white]),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle),
                              constraints:
                                  const BoxConstraints(maxWidth: 150.0),
                              child: Column(
                                children: [
                                  AppText("RENT",
                                      size: 14, color: Palette.secondary),
                                  const SizedBox(height: 20.0),
                                  Countup(
                                    begin: 2000,
                                    end: 2212,
                                    duration: const Duration(seconds: 4),
                                    separator: ' ',
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        color: Palette.secondary),
                                  ),
                                  AppText("offers",
                                      size: 10.0, color: Palette.secondary)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          pinned: true,
          floating: false,
          stretch: true,
          collapsedHeight: 80,
        ),
        // Placeholder for additional content in the upper part, if needed
      ],
    );
  }
}
