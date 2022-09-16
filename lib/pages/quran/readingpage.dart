import 'package:azkark/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quran/quran.dart' as quran;

import '../../models/surah.dart';

class SurahPage extends StatefulWidget {
  final Surah surah;
  const SurahPage({Key key,  this.surah}) : super(key: key);

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  double fontSize;
  @override
  void initState() {
    super.initState();
    fontSize = Provider.of<SettingsProvider>(context, listen: false)
        .getsettingField('font_size');
  }

  @override


  Widget build(BuildContext context) {
    int count = widget.surah.versesCount;
    int index = widget.surah.id;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: SafeArea(
          minimum: const EdgeInsets.all(15),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: header(),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              textAlign: count <= 20 ? TextAlign.center : TextAlign.justify,
              text: TextSpan(
                children: [
                  for (var i = 1; i <= count; i++) ...{
                    TextSpan(
                      text: ' ' +
                          quran.getVerse(index, i, verseEndSymbol: false) +
                          ' ',
                      style:  TextStyle(
                        fontFamily: 'Kitab',
                        fontSize: fontSize,
                        color: Colors.blue,
                      ),
                    ),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: CircleAvatar(
                          child: Text(
                            '$i',
                            textAlign: TextAlign.center,
                            textScaleFactor: i.toString().length <= 2 ? 1 : .8,
                          ),
                          radius: fontSize,
                        ))
                  }
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.surah.arabicName,
              style: const TextStyle(
                fontFamily: 'Aldhabi',
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              ' ' + quran.basmala + ' ',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'NotoNastaliqUrdu',
                fontSize: 30,
              ),
            ),
          ],
        ));
  }
}
