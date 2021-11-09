import 'package:flutter/material.dart';
import 'package:ui_taks_1/app/device.prop.dart';

class EmptySquircle extends StatelessWidget {
  const EmptySquircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(width(context) * 0.35)),
      child: Container(
        height: width(context) * 0.35,
        width: width(context) * 0.35,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius:
              BorderRadius.all(Radius.circular(width(context) * 0.08)),
        ),
      ),
    );
  }
}
