// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/config/theme/palette.dart';
import 'package:real_estate_app/widgets/app_text.dart';
import 'package:real_estate_app/widgets/map_button.dart';
import 'package:real_estate_app/widgets/search_bar.dart';
import 'package:real_estate_app/wrappers/house_pin.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool showMenu = false;
  String? selectedTitle;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            showMenu = false;
          }),
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: Palette.black,
                image: const DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/map.jpg"))),
          ),
        ),
        Positioned(
            top: MediaQuery.sizeOf(context).height * 0.1,
            left: 20.0,
            right: 20.0,
            child: Row(
              children: [
                Expanded(child: CustomSearchBar(TextEditingController())),
                const SizedBox(width: 6.0),
                IconButton(
                  splashRadius: 26.0,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  icon: Container(
                    height: 42.0,
                    width: 42.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      "assets/icons/filter.svg",
                      color: Palette.grey.withOpacity(0.9),
                      height: 16.0,
                    ),
                  ),
                )
              ],
            )),
        const Positioned(top: 250.0, left: 120.0, child: HousePin()),
        const Positioned(top: 300.0, left: 130.0, child: HousePin()),
        const Positioned(top: 480.0, left: 60.0, child: HousePin()),
        const Positioned(top: 350.0, left: 250.0, child: HousePin()),
        const Positioned(top: 450.0, left: 250.0, child: HousePin()),
        const Positioned(top: 550.0, left: 180.0, child: HousePin()),
        Positioned(
          left: 20.0,
          right: 20.0,
          bottom: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  MapButton(
                    SvgPicture.asset(
                      "assets/icons/layers.svg",
                      height: 16.0,
                      color: Colors.white70,
                    ),
                    onTap: () => setState(() {
                      showMenu = true;
                    }),
                  ),
                  Card(
                    clipBehavior: Clip.hardEdge,
                    color: Palette.button,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: showMenu ? 200.0 : 0,
                      width: showMenu ? 180.0 : 0,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: MenuTile(
                                    title: "Cosy areas",
                                    leading: "assets/icons/shield-check.svg",
                                  ),
                                ),
                                Expanded(
                                  child: MenuTile(
                                    title: "Price",
                                    leading: "assets/icons/wallet.svg",
                                  ),
                                ),
                                Expanded(
                                  child: MenuTile(
                                    title: "Infrastructure",
                                    leading: "assets/icons/bridge.svg",
                                  ),
                                ),
                                Expanded(
                                  child: MenuTile(
                                    title: "Without any layer",
                                    leading: "assets/icons/layers.svg",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MapButton(
                    SvgPicture.asset(
                      "assets/icons/location-arrow.svg",
                      height: 16.0,
                      color: Colors.white70,
                    ),
                  ),
                  const MapButton(Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.sort_rounded,
                            color: Colors.white70, size: 24),
                        SizedBox(width: 8.0),
                        AppText("List of variants",
                            size: 12.0, color: Colors.white)
                      ],
                    ),
                  )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

//Temp state management
final selectedOptionProvider = StateProvider((option) => "");

class MenuTile extends ConsumerWidget {
  final String title;
  final String leading;

  const MenuTile({required this.title, required this.leading, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String selectedOption = ref.watch(selectedOptionProvider);
    return ListTile(
      leading: SvgPicture.asset(leading,
          height: 22.0,
          color: selectedOption == title ? Palette.primary : Colors.grey),
      minLeadingWidth: 0.0,
      minVerticalPadding: 0.0,
      minTileHeight: 0.0,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      horizontalTitleGap: 10.0,
      title: AppText(title,
          color: selectedOption == title ? Palette.primary : Palette.grey,
          size: 13.0,
          weight: FontWeight.w500),
      onTap: () {
        ref.read(selectedOptionProvider.notifier).update((option) => title);
      },
    );
  }
}
