import '../../../util/colors.dart';
import 'package:flutter/material.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height * 0.5,
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/icons/favorites/empty.png',
            color: blue[400].withAlpha(200),
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.contain,
            // height: size.height,
          ),
        ),
        Text(
          'المفضلة فارغة',
          style: TextStyle(
            color: blue[700],
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
