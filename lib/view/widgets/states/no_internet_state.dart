import 'package:flutter/material.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/color_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/text_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/unit_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/text_hierarchy.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_button.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_text.dart';

class NoInternetState extends StatelessWidget {
  final void Function()? onPressed;

  const NoInternetState({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 24.0,
        children: <Widget>[
          Image.asset(
            'assets/images/no_internet_connection.png',
          ),
          const MyText(
            text: TextManager.LOST_CONNECTION,
            color: ColorManager.BLACK,
            textHierarchy: TextHierarchy.header,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          MyButton(
            isPrimaryButton: false,
            isCropButton: false,
            needElevation: true,
            width: 99.0,
            height: 30.0,
            borderRadius: UnitManager.RADIUS_SMALL,
            text: TextManager.LOST_CONNECTION,
            color: ColorManager.BLACK,
            textHierarchy: TextHierarchy.bodyMedium,
            fontWeight: FontWeight.w500,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
