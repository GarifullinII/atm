import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';

/// Pages top bar with back navigation
class TopBar extends StatelessWidget {
  /// Constructor
  /// @param label - app bar label
  /// @param labelWidget - widget instead text
  /// @param centerLabel - center for label
  /// @param lead - lead widget
  /// @param leadAction - show back button

  const TopBar({
    required this.label,
    this.labelWidget,
    this.lead,
    this.leadAction = true,
    super.key,
  });

  /// Page label
  final String label;

  /// Widget instead text
  final Widget? labelWidget;

  /// Lead widget
  final Icon? lead;

  /// Show edit action
  final bool leadAction;

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: ColorConstants.blueColor,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/images/ellipse.svg',
              width: 25.35,
              height: 20.82,
            ),
          ],
        ),
        title: labelWidget ??
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Trebuchet MS',
                fontSize: 20,
                color: ColorConstants.labelColor,
                fontWeight: FontWeight.w400,
              ),
            ),
      );
}
