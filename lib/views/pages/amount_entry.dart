import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../widgets/topbar.dart';

/// Amount entry page
class AmountEntryPage extends StatefulWidget {
  /// Amount entry page constructor
  const AmountEntryPage({super.key});

  @override
  State<AmountEntryPage> createState() => _AmountEntryPageState();
}

class _AmountEntryPageState extends State<AmountEntryPage> {
  /// Input controller
  final TextEditingController controller = TextEditingController();

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
                ClipPath(
                  clipper: DrawClip(),
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      gradient: ColorConstants.backgroundColor,
                    ),
                  ),
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
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height*0.85);
    path.cubicTo(
      size.width*0.5,
      size.height*0.8,
      size.width*0.5,
      size.height,
      size.width,
      size.height*0.9,
    );
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
