import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';

/// Top bar widget
class TopBar extends StatelessWidget implements PreferredSizeWidget {
  /// Constructor
  /// @param label - app bar label

  const TopBar({
    required this.label,
    super.key,
  });

  /// Page label
  final String label;

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 10,
        shadowColor: ColorConstants.shadowTopBarColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: ColorConstants.circuitFirstColor),
        ),
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 21, top: 15),
          child: Stack(
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/ellipse_left.svg',
                width: 25.35,
                height: 20.82,
              ),
              Positioned(
                left: 4,
                child: SvgPicture.asset(
                  'assets/images/ellipse_right.svg',
                  width: 25.35,
                  height: 20.82,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        titleTextStyle: TextStyle(
          fontFamily: 'Trebuchet MS',
          fontSize: 20,
          color: ColorConstants.labelColor,
          fontWeight: FontWeight.w400,
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
