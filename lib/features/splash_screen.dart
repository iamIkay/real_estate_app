import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/config/theme/palette.dart';
import 'package:real_estate_app/widgets/app_text.dart';

import '../config/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.pushReplacement(Routes.wrapper);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.center,
              colors: [
                Palette.gradient.withOpacity(0.1),
                Colors.white,
                Colors.white,
              ]),
        ),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText("Real Estate",
                style: GoogleFonts.sacramento(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w600,
                    color: Palette.black),
                size: 34.0,
                weight: FontWeight.w600),
            AppText(
              "Homes at Your Fingertips — Find, Fall in Love, Move In!",
              size: 12.0,
              weight: FontWeight.w700,
              align: TextAlign.center,
              color: Palette.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
