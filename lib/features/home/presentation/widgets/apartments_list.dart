import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../config/theme/palette.dart';
import '../../../../widgets/app_text.dart';

class ApartmentList extends StatefulWidget {
  const ApartmentList({super.key});

  @override
  State<ApartmentList> createState() => _ApartmentListState();
}

class _ApartmentListState extends State<ApartmentList>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _animation = Tween<double>(begin: 0.1, end: 0.44).animate(
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
      onVisibilityChanged: (visibility) {
        if (_controller?.status != AnimationStatus.completed) {
          _controller!.forward();
        }
      },
      child: AnimatedBuilder(
          animation: _animation!,
          builder: (context, child) {
            return Container(
              margin: const EdgeInsets.only(top: 40.0),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: _animation!.value == 0.1 ? 0 : 1,
                child: DraggableScrollableSheet(
                  initialChildSize: _animation!.value, // minchildSize, //0.4,
                  minChildSize: _animation!.value, //minchildSize, //0.4,
                  maxChildSize: 0.84,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24.0),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      clipBehavior: Clip.hardEdge,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: ListView(
                          controller: scrollController,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 110.0),
                          children: [
                            Container(
                                height: 190.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/apt-image.jpg"))),
                                alignment: Alignment.bottomCenter,
                                child: const TitleSlideBar(
                                    "Gladvoka St. 25", 100,
                                    isHeadliner: true)),
                            const SizedBox(height: 10.0),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              children: List.generate(10, (index) {
                                return Container(
                                  height: 190.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/apt-image2.jpg"))),
                                  child: TitleSlideBar("Tafawa St. 24", index),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}

bool animated = false;

class TitleSlideBar extends StatefulWidget {
  final String location;
  final bool isHeadliner;
  final int index;
  const TitleSlideBar(this.location, this.index,
      {this.isHeadliner = false, super.key});

  @override
  State<TitleSlideBar> createState() => _TitleSlideBarState();
}

class _TitleSlideBarState extends State<TitleSlideBar>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: animated ? 1000 : 0, end: 1000).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeInOut),
    );

    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(widget.index),
      onVisibilityChanged: (visibility) {
        if (_controller?.status != AnimationStatus.completed) {
          _controller!.forward().then((_) => animated = true);
        }
      },
      child: AnimatedBuilder(
          animation: _animation!,
          builder: (context, child) {
            return Container(
              alignment: Alignment.bottomLeft,
              margin:
                  const EdgeInsets.only(bottom: 12.0, right: 12.0, left: 12.0),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(26.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Stack(
                    children: [
                      Container(
                        // duration: const Duration(milliseconds: 3000),
                        width: _animation!.value,

                        // clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Palette.offwhite.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(18.0)),
                        height: 47.0,
                        child: Stack(
                          alignment: widget.isHeadliner
                              ? Alignment.center
                              : Alignment.center,
                          children: [
                            Container(
                              padding: widget.isHeadliner
                                  ? EdgeInsets.zero
                                  : const EdgeInsets.only(
                                      left: 12, right: 49.0),
                              child: AppText(widget.location,
                                  weight: FontWeight.w500,
                                  maxLines: 1,
                                  size: widget.isHeadliner ? 14.0 : 12.0,
                                  align: TextAlign.center),
                            ),
                            Positioned(
                              right: 0.0,
                              child: AnimatedOpacity(
                                opacity: 1,
                                duration: const Duration(milliseconds: 200),
                                child: Container(
                                  height: MediaQuery.sizeOf(context).height,
                                  width: 48.0,
                                  decoration: BoxDecoration(
                                    color: Palette.button,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.arrow_forward_ios,
                                      size: 10.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
