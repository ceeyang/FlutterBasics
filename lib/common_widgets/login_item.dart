import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basics/res/resouce.dart';

class LoginItem extends StatefulWidget {
  const LoginItem({
    Key key,
    this.prefixIcon,
    this.hasSuffixIcon = false,
    this.hintText,
    this.controller,
  }) : super(key: key);

  final IconData prefixIcon;
  final bool hasSuffixIcon;
  final String hintText;
  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() {
    return LoginItemState();
  }
}

class LoginItemState extends State<LoginItem> {
  bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.hasSuffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new IconButton(
            iconSize: 28,
            icon: new Icon(
              widget.prefixIcon,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {}),
        Gaps.hGap30,
        new Expanded(
          child: new TextField(
              obscureText: _obscureText,
              controller: widget.controller,
              style: new TextStyle(color: Colors.white, fontSize: 14),
              decoration: new InputDecoration(
                hintText: widget.hintText,
                hintStyle: new TextStyle(color: Colors.white, fontSize: 14),
                suffixIcon: widget.hasSuffixIcon
                    ? new IconButton(
                        icon: new Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: CommonColours.gray_66,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        })
                    : null,
                focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.blueAccent)),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.blueAccent)),
              )),
        ),
      ],
    );
  }
}
