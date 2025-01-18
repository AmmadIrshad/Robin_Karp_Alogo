import 'package:flutter/widgets.dart';

extension Space on double {
  SizedBox get vSpace => SizedBox(
        height: this,
      );

  SizedBox get hSpace => SizedBox(
        width: this,
      );
}
