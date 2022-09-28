import 'package:azkark/providers/setting_cubit.dart';
import 'package:azkark/providers/settings_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../slider_font_size/slider_font_size.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';

class SettingFontSize extends StatefulWidget {
  final BorderRadius borderRadius;

  const SettingFontSize({Key key, this.borderRadius}) : super(key: key);

  @override
  _SettingFontSizeState createState() => _SettingFontSizeState();
}

class _SettingFontSizeState extends State<SettingFontSize> {
  double fontSize;
  bool showSlider;

  @override
  void initState() {
    super.initState();

    fontSize = Provider.of<SettingsProvider>(context, listen: false)
        .getsettingField('font_size');
    showSlider = false;
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    return BlocConsumer<SettingCubit, SettingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return InkWell(
            highlightColor: Colors.transparent,
            splashColor: blue[200],
            onTap: () {
              setState(() {
                showSlider = !showSlider;
              });
            },
            borderRadius: widget.borderRadius,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          'حجم الخط',
                          style: TextStyle(
                            color: blue,
                            fontSize: SettingCubit.get(context).fontSize,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 10.0, right: 8.0),
                        child: Text(
                          '${SettingCubit.get(context).fontSize}',
                          style: TextStyle(
                            color: blue[600],
                            fontSize: SettingCubit.get(context).fontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: SliderFontSize(
                      fontSize: SettingCubit.get(context).fontSize,
                      min: 16,
                      max: 40,
                      overlayColor: Colors.transparent,
                      onChanged: (value) {
                        SettingCubit.get(context).changeFontSize(value);
                        // setState(() {
                        //   fontSize = value;
                        // });
                      },
                      onChangedEnd: (value) {
                        settingsProvider.updateSettings('font_size', value);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
