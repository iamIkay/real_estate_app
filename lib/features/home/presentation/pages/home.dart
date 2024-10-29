import 'package:flutter/material.dart';
import 'package:real_estate_app/features/home/presentation/widgets/apartments_list.dart';
import 'package:real_estate_app/features/home/presentation/widgets/dashboard.dart';

import '../../../../config/theme/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Palette.gradient.withOpacity(0.2),
                    Palette.gradient.withOpacity(1)
                  ]),
            ),
          ),
          const Dashboard(),
          const ApartmentList()
        ],
      ),
    );
  }
}
