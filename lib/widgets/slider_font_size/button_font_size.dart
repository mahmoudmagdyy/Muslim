import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';

class ButtonFontSize extends StatelessWidget {
  final bool showSider;
  final Function onTap;

  const ButtonFontSize({Key key,
    this.showSider,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'تغيير حجم الخط',
      padding: const EdgeInsets.all(0.0),
      highlightColor: Colors.transparent,
      splashColor: blue[700],
      icon: Container(
        padding: const EdgeInsets.only(top: 2.5, bottom: 2.5, left: 5.0, right: 5.0),
        decoration: BoxDecoration(
            color: showSider ? blue[50] : Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: FaIcon(
          FontAwesomeIcons.font,
          color: showSider ? blue[800] : blue[50],
          size: 20,
        ),
      ),
      onPressed: onTap,
    );
  }
}
