import 'package:azkark/database/cache_heper.dart';
import 'package:azkark/providers/setting_cubit.dart';
import 'package:azkark/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

import '../../models/surah.dart';

class SurahPage extends StatefulWidget {
  final Surah surah;
   SurahPage({Key key, this.surah}) : super(key: key);

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {

  double fontSize;
  int mark = 0;
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
      child: BlocConsumer<SettingCubit, SettingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                widget.surah.arabicName,
                style: const TextStyle(
                  fontFamily: '2',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    CacheHelper.saveData(
                      key: 'idSurah',
                      value: widget.surah.id,
                    ).then((value) {
                      print('save id surah ${widget.surah.id}');
                    });
                  },
                ),
              ],
            ),
            body: SafeArea(
              minimum: const EdgeInsets.all(2),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.blue[200],
                    width: 7,
                  ),
                ),
                child: ListView(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: header(),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    textAlign:
                        count <= 20 ? TextAlign.center : TextAlign.justify,
                    text: TextSpan(
                      children: [
                        for (var i = 1; i <= count; i++) ...{
                          TextSpan(
                            text: ' ' +
                                quran.getVerse(index, i,
                                    verseEndSymbol: false) +
                                ' ',
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontSize:fontSize,
                              fontWeight: FontWeight.w200,
                              color: Colors.black87,
                            ),
                          ),
                          WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: InkWell(
                                onTap: () {
                                  debugPrint(i.toString());
                                },
                                child:Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      height: fontSize,
                                      width: fontSize,
                                      clipBehavior: Clip.none,
                                      child: Image.asset(
                                        "assets/101.png",
                                        color: mark == i
                                            ? Colors.orange
                                            : Colors.black,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      '$i',
                                      textAlign: TextAlign.center,
                                      textScaleFactor:
                                      i.toString().length <= 2 ? 1 : .8,
                                    ),
                                  ],
                                )
                              ))
                        }
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget header() {
    return const Text(
      ' ' + quran.basmala + ' ',
      textDirection: TextDirection.rtl,
      style:
          TextStyle(fontFamily: '2', fontSize: 26, fontWeight: FontWeight.w700),
    );
  }
}
