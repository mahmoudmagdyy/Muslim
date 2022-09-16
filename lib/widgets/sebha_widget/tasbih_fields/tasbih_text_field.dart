import 'package:azkark/util/colors.dart';
import 'package:azkark/util/helpers.dart';
import 'package:flutter/material.dart';

class TasbihTextField extends StatefulWidget {
  final String text, hintText, errorText;
  final int maxLines, maxlength;
  final ValueChanged<String> onSubmitted, onChanged;
  final bool isNumber, autoFocus, isFinalField;

  const TasbihTextField({Key key,
    this.text,
    @required this.hintText,
    this.errorText,
    this.maxLines,
    this.maxlength,
    this.onSubmitted,
    this.onChanged,
    this.isNumber = false,
    this.isFinalField = false,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  _TasbihTextFieldState createState() => _TasbihTextFieldState();
}

class _TasbihTextFieldState extends State<TasbihTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);

    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: blue[100], borderRadius: BorderRadius.circular(10)),
      child: TextField(
        autofocus: widget.autoFocus,
        textDirection: isTextDirectionRTL(_controller.text)
            ? TextDirection.rtl
            : TextDirection.ltr,
        controller: _controller,
        maxLines: widget.maxLines,
        maxLength: widget.maxlength,
        cursorColor: blue[700],
        style: TextStyle(
          color: blue[600],
        ),
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        textInputAction:
            widget.isFinalField ? TextInputAction.done : TextInputAction.next,
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          errorText: widget.errorText,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blueGrey, width: 1.0),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: blue[400].withAlpha(175),
          ),
          contentPadding: const EdgeInsets.all(15.0),
          border: InputBorder.none,
          counterStyle: TextStyle(
            color: blue[400].withAlpha(175),
          ),
        ),
      ),
    );
  }
}
