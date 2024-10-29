import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../config/theme/palette.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController _searchController;

  const CustomSearchBar(this._searchController, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.0,
      child: TextField(
        maxLines: 1,
        style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
        controller: _searchController,
        cursorColor: Palette.grey,
        decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
          hintText: "Search location",
          hintStyle: TextStyle(
            // fontSize: 14.0,
            color: Palette.grey.withOpacity(0.7),
          ),
          labelStyle: const TextStyle(fontSize: 13.0),
          prefixIcon: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Iconsax.search_normal4,
                  color: Palette.grey.withOpacity(0.9), size: 20.0)
            ],
          ),
          prefixIconColor: Palette.black,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.black),
            borderRadius: BorderRadius.circular(24.0),
          ),
          floatingLabelStyle: TextStyle(
            color: Palette.secondary,
            fontSize: 18.0,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: BorderSide(color: Palette.black)),
        ),
      ),
    );
  }
}
