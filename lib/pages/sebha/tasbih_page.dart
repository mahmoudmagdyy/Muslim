import 'package:azkark/widgets/sebha_widget/Expansion_tile_sebha.dart';
import 'package:azkark/widgets/sebha_widget/button_drag.dart';
import '../../models/sebha_model.dart';
import '../../util/helpers.dart';
import '../../util/colors.dart';
import 'package:flutter/material.dart';

class SebhaPage extends StatefulWidget {
  final SebhaModel _tasbih;

    const SebhaPage(this._tasbih, {Key key}) : super(key: key);

  @override
  _SebhaPageState createState() => _SebhaPageState();
}

class _SebhaPageState extends State<SebhaPage> {
  int currentCounter, round;
  double percentage;

  @override
  void initState() {
    super.initState();
    currentCounter = 0;
    round = 0;
    percentage = 0.0;
  }

  void onTapButton() {
    setState(() {
      if (widget._tasbih.counter == 0) {
        currentCounter++;
      } else {
        percentage = ((currentCounter * 100) / widget._tasbih.counter) * 0.01;
        if (currentCounter < widget._tasbih.counter) {
          currentCounter++;
        } else {
          currentCounter = 1;
          round++;
          percentage = 0.0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blue,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          translate(context, 'sebha_bar'),
          style: TextStyle(
            color: blue[50],
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.all(8.0),
            child: IconButton(
              color: blue[50],
              highlightColor: blue[700],
              splashColor: blue[700],
              padding: const EdgeInsets.all(0.0),
              icon: const Icon(Icons.lock_outline),
              onPressed: _buildLockScreen,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ExpansionTileSebha(
            title: _buildRowInformation(),
            initiallyExpanded: true,
            child: _buildName(),
          ),
          Expanded(
            child: _buildButton(),
          ),
        ],
      ),
    );
  }

  void _buildLockScreen() {
    showDialog(
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: GestureDetector(
          onTap: onTapButton,
          child: Stack(
            children: <Widget>[
              Container(
                color: blue[900].withAlpha(10),
              ),
              Align(
                alignment: Alignment.center,
                child: DraggableButton(
                  onDrag: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowInformation() {
    return Container(
      alignment: Alignment.center,
      // color: Colors.green,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: <Widget>[
          _buildNumberCount(),
          if (widget._tasbih.counter != 0) _buildRoundNumber(),
          _buildCurrentNumber(),
        ],
      ),
    );
  }

  Widget _buildName() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      child: Material(
        color: blue[700],
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          splashColor: blue[600],
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          onTap: onTapButton,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget._tasbih.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: blue[50],
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberCount() {
    return Container(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: blue[600],
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget._tasbih.counter == 0
          ? Text(
              '?????? ???????????? : ????????',
              style: TextStyle(
                  color: blue[50], fontWeight: FontWeight.w500, fontSize: 14),
            )
          : Text(
              '?????? ???????????? : ${widget._tasbih.counter}',
              style: TextStyle(
                color: blue[50],
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
    );
  }

  Widget _buildRoundNumber() {
    return Container(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: blue[600],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '?????? : $round',
        style: TextStyle(
          color: blue[50],
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildCurrentNumber() {
    return Container(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: blue[600],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '?????????? ???????????? : $currentCounter',
        style: TextStyle(
          color: blue[50],
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Stack(
      children: <Widget>[
        Material(
          color: blue[700],
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            splashColor: blue[600],
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            onTap: onTapButton,
            child: _buildCounter(),
          ),
        ),
        Align(alignment: Alignment.topRight, child: _buildButtonReset()),
      ],
    );
  }

  Widget _buildCounter() {
    return Center(
      child: Text(
        '${currentCounter + (round * widget._tasbih.counter)}',
        style: TextStyle(
          color: blue[50],
          fontWeight: FontWeight.w500,
          fontFamily: '0',
          fontSize: 60,
        ),
      ),
    );
  }

  Widget _buildButtonReset() {
    return Material(
      color: blue,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
      ),
      child: InkWell(
        splashColor: blue[600],
        highlightColor: Colors.transparent,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
        ),
        onTap: () => setState(() {
          currentCounter = 0;
          round = 0;
          percentage = 0.0;
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.settings_backup_restore,
            color: blue[50],
          ),
        ),
      ),
    );
  }
}
