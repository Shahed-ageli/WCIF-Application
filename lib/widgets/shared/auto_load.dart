import 'package:flutter/material.dart';

class AutoLoad extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const AutoLoad({@required this.onInit, @required this.child});
  @override
  _AutoLoadState createState() => _AutoLoadState();
}

class _AutoLoadState extends State<AutoLoad> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: widget.child,
    );
  }
}