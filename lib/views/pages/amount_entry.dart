import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../utils/constants.dart';
import '../widgets/topbar.dart';

/// Amount entry page
class AmountEntryPage extends StatefulWidget {
  /// Amount entry page constructor
  const AmountEntryPage({super.key});

  @override
  State<AmountEntryPage> createState() => _AmountEntryPageState();
}

class _AmountEntryPageState extends State<AmountEntryPage>
    with TickerProviderStateMixin {
  /// Input controller
  final TextEditingController controller = TextEditingController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(
        label: 'ATM',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                AnimatedBuilder(
                  animation: _animationSecondController,
                  builder: (BuildContext context, Widget? child) {
                    return ClipPath(
                      clipper: SecondDrawClip(_animationSecondController.value),
                      child: Container(
                        height: 200,
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
                        height: 180,
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
                        height: 200,
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
                        height: 220,
                        decoration: BoxDecoration(
                          gradient: ColorConstants.circuitFourthColor,
                        ),
                      ),
                    );
                  },
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: Text(
                        'Введите сумму',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          color: ColorConstants.labelColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 89,
                      ),
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: '1 234.00 руб',
                          hintStyle: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 30,
                            color: ColorConstants.labelColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 30,
                          color: ColorConstants.labelColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ColorConstants.pinkColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 42,
                  vertical: 22,
                ),
                child: Text(
                  'Выдать сумму',
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    color: ColorConstants.labelColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: ColoredBox(
                color: ColorConstants.greyOpacityColor,
                child: const Align(
                  heightFactor: 2,
                  child: SizedBox(
                    height: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
                top: 41,
                right: 60,
                bottom: 45,
              ),
              child: Text(
                'Банкомат не может выдать запрашиваемую сумму',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 18,
                  color: ColorConstants.pinkColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ColoredBox(
              color: ColorConstants.greyOpacityColor,
              child: const Align(
                heightFactor: 2,
                child: SizedBox(
                  height: 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 21,
                          top: 14,
                          bottom: 15,
                        ),
                        child: Text(
                          'Баланс банкомата',
                          style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 13,
                            color: ColorConstants.greyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '50 X 100 рублей',
                              style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 14,
                                color: ColorConstants.blueColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '100 X 200 рублей',
                              style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 14,
                                color: ColorConstants.blueColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '100 X 2000 рублей',
                              style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 14,
                                color: ColorConstants.blueColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 36,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '5 X 500 рублей',
                              style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 14,
                                color: ColorConstants.blueColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '10 X 1000 рублей',
                              style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 14,
                                color: ColorConstants.blueColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '10 X 5000 рублей',
                              style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 14,
                                color: ColorConstants.blueColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ColoredBox(
              color: ColorConstants.greyOpacityColor,
              child: const Align(
                heightFactor: 2,
                child: SizedBox(
                  height: 10,
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}

class FirstDrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  FirstDrawClip(this.move);

  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.85);
    path.cubicTo(
      size.width * 0.5,
      size.height * 0.65 + math.cos(move * slice),
      size.width * 0.5 + (size.width * 0.5) * math.sin(move * slice),
      size.height,
      size.width,
      size.height * 0.95,
    );
    path.lineTo(size.width, 0);

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
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.cubicTo(
      size.width * 0.5,
      size.height * 0.8 + math.cos(move * slice),
      size.width * 0.8 + (size.width * 0.5) * math.sin(move * slice),
      size.height,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);

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
    Path path = Path();
    path.lineTo(0, size.height * 0.85);
    path.cubicTo(
      size.width * 0.45 + (size.width * 0.5) * math.sin(move * slice),
      size.height,
      size.width * 0.5,
      size.height * 0.4 + math.cos(move * slice),
      size.width,
      size.height * 0.75,
    );
    path.lineTo(size.width, 0);

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
    Path path = Path();
    path.lineTo(0, size.height * 0.68);
    path.cubicTo(
      size.width * 0.75 + (size.width * 0.5) * math.sin(move * slice),
      size.height,
      size.width * 0.55,
      size.height * 0.4 + math.cos(move * slice),
      size.width,
      size.height * 0.85,
    );
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
