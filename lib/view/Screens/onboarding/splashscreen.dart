import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constant.dart';
import '../home/LayoutScreen.dart';
import 'gredScreen.dart';
import 'onbordingScreen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splashIconSize: double.infinity,
      backgroundColor: white,
      centered: true,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      splash: SvgPicture.asset("$imgSplash"),
      nextScreen: LayoutScreen(),
    );
  }
}
