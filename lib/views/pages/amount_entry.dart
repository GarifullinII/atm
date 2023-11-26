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
    with SingleTickerProviderStateMixin {
  /// Input controller
  final TextEditingController controller = TextEditingController();

  /// Animation controller
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 10),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

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
                  animation: animationController,
                  builder: (BuildContext context, Widget? child) {
                    return ClipPath(
                      clipper: DrawClip(animationController.value),
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          gradient: ColorConstants.circuitFirstColor,
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
                      padding: const EdgeInsets.only(
                        left: 89,
                        // top: 8,
                        right: 89,
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
          ],
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);

  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.85);
    path.cubicTo(
      size.width * 0.5,
      size.height * 0.6,
      size.width * 0.5 + (size.width*0.5)*math.sin(move * slice),
      size.height + math.cos(move * slice),
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
