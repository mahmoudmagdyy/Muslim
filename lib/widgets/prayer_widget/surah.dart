import '../../util/colors.dart';
import 'package:flutter/material.dart';

class Surah extends StatelessWidget {
  final int number;
  final double fontSize;
  final String surah;
  final bool showAlAyat;
  final Function onTap;

   const Surah({Key key,
    this.number,
    this.fontSize,
    this.surah,
    this.onTap,
    this.showAlAyat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: blue[300],
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: blue[200],
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.topRight, child: _buildNumberField()),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 15.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildNameField(),
                  Icon(
                    showAlAyat
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: blue[700],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: blue[200],
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Text(
        '$number',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: blue[700],
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        'سورة $surah',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: blue,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
