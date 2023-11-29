import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../utils/constants.dart';

/// Bottom bar widget

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  /// Animation controllers
  late AnimationController _animationFirstController;
  late AnimationController _animationSecondController;
  late AnimationController _animationThirdController;
  late AnimationController _animationFourthController;

  @override
  void initState() {
    // Animation for FirstDrawClip
    _animationFirstController = AnimationController(
      value: 0,
      duration: const Duration(seconds: 10),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();

    // Animation for SecondDrawClip
    _animationSecondController = AnimationController(
      value: 0,
      duration: const Duration(seconds: 10),
      upperBound: 1,
      lowerBound: 0,
      vsync: this,
    )..repeat();

    // Animation for ThirdDrawClip
    _animationThirdController = AnimationController(
      value: 0,
      duration: const Duration(seconds: 10),
      upperBound: 0,
      lowerBound: -1,
      vsync: this,
    )..repeat();

    // Animation for FourthDrawClip
    _animationFourthController = AnimationController(
      value: 0,
      duration: const Duration(seconds: 10),
      upperBound: 0,
      lowerBound: -1,
      vsync: this,
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _animationFirstController.dispose();
    _animationSecondController.dispose();
    _animationThirdController.dispose();
    _animationFourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          AnimatedBuilder(
            animation: _animationSecondController,
            builder: (BuildContext context, Widget? child) {
              return ClipPath(
                clipper: SecondDrawClip(_animationSecondController.value),
                child: Container(
                  height: 88,
                  decoration: BoxDecoration(
                    gradient: ColorConstants.circuitFirstColor,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animationFirstController,
            builder: (BuildContext context, Widget? child) {
              return ClipPath(
                clipper: FirstDrawClip(_animationFirstController.value),
                child: Container(
                  height: 78,
                  decoration: BoxDecoration(
                    gradient: ColorConstants.circuitSecondColor,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animationThirdController,
            builder: (BuildContext context, Widget? child) {
              return ClipPath(
                clipper: ThirdDrawClip(_animationThirdController.value),
                child: Container(
                  height: 86,
                  decoration: BoxDecoration(
                    gradient: ColorConstants.circuitThirdColor,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animationFourthController,
            builder: (BuildContext context, Widget? child) {
              return ClipPath(
                clipper: FourthDrawClip(_animationFourthController.value),
                child: Container(
                  height: 88,
                  decoration: BoxDecoration(
                    gradient: ColorConstants.circuitFourthColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FirstDrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  FirstDrawClip(this.move);

  @override
  getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * 0.25)
      ..cubicTo(
        size.width * 0.5,
        size.height * 0.3 + math.cos(move * slice),
        size.width * 0.65 + (size.width * 0.5) * math.sin(move * slice),
        size.height * 0.85,
        size.width,
        size.height * 0.55,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class SecondDrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  SecondDrawClip(this.move);

  @override
  getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * 0.45)
      ..cubicTo(
        size.width * 0.35,
        size.height * 0 + math.cos(move * slice),
        size.width * 0.65 + (size.width * 0.5) * math.sin(move * slice),
        size.height * 0.55,
        size.width,
        size.height * 0.75,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class ThirdDrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  ThirdDrawClip(this.move);

  @override
  getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * 0.4)
      ..cubicTo(
        size.width * 0.35,
        size.height + math.cos(move * slice),
        size.width * 0.75 + (size.width * 0.5) * math.sin(move * slice),
        size.height * 0.35,
        size.width,
        size.height * 0.4,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class FourthDrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  FourthDrawClip(this.move);

  @override
  getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * 0.1)
      ..cubicTo(
        size.width * 0.35,
        size.height + math.cos(move * slice),
        size.width * 0.65 + (size.width * 0.5) * math.sin(move * slice),
        size.height * 0,
        size.width,
        size.height * 0.65,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
