import 'package:flutter/material.dart';
import 'package:ui_taks_1/app/device.prop.dart';

class Circle extends StatelessWidget {
  const Circle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(width(context) * 0.35)),
      child: Container(
        height: width(context) * 0.35,
        width: width(context) * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(width(context) * 0.35)),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Dragable and Dropable Circle',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
