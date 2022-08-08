import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:community_material_icon/community_material_icon.dart';

import '/my_colors.dart';
import 'home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  //
  late Animation<double> _opacity;
  late Animation<double> _position;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _position = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1),
      ),
    )..addListener(() {
        setState(() {});
      });

    _opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.5, 1),
      ),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    //
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: MyColors.myBlack,
        child: Stack(
          children: [
            Positioned(
              bottom: -250,
              child: Container(
                width: size.width,
                height: size.width + 250,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 0.65,
                    colors: [MyColors.myOrange, MyColors.myBlack],
                  ),
                ),
              ),
            ),

            // Image NIKE
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 50,
                ),
                child: Image.asset(
                  'assets/img_nike_text.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Image shoes
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 50,
                ),
                child: Image.asset(
                  'assets/img_shoes.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height / 2,
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    // Text - Live your perfect
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'LIVE YOUR \nPERFECT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Text - Smart, gorgeous & fashinonable\ncollectoion makes you cool
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text:
                            'Smart, gorgeous & fashinonable\ncollectoion makes you cool',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      onVerticalDragUpdate: (details) {
                        int sensitivity = 8;
                        if (details.delta.dy < -sensitivity) {
                          // if swipe up the icon
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const HomeScreen(),
                                  type: PageTransitionType.bottomToTop));
                        }
                      },
                      child: AbsorbPointer(
                        child: Column(
                          children: [
                            // Icon
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Opacity(
                                opacity: _opacity.value,
                                child: const Icon(
                                  CommunityMaterialIcons.chevron_double_up,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // Text - Get Started
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                text: 'Get Started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
