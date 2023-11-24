import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../widgets/topbar.dart';

/// Amount entry page
class AmountEntryPage extends StatelessWidget {
  /// Amount entry page constructor
  const AmountEntryPage({super.key});

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
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    gradient: ColorConstants.backgroundColor,
                  ),
                ),
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
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
