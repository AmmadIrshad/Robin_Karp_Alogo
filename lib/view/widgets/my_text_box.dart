import 'package:flutter/material.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/color_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/unit_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/size_config.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/text_hierarchy.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_text.dart';

class MyTextBox extends StatefulWidget {
  final String text;
  final String title;

  const MyTextBox({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  State<MyTextBox> createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: UnitManager.TEXT_BOX_VERTICAL_PADDING,
        horizontal: UnitManager.TEXT_BOX_HORIZONTAL_PADDING,
      ),
      height: getProportionateScreenHeight(186.0),
      width: getProportionateScreenWidth(317.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UnitManager.RADIUS_EXTRA_LARGE),
        color: ColorManager.WHITE,
        border: Border.all(
          color: ColorManager.BLACK,
          width: UnitManager.BORDER_WIDTH,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: <Widget>[
          MyText(
            text: widget.title,
            color: ColorManager.BLACK,
            textHierarchy: TextHierarchy.display,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          const Divider(
            color: ColorManager.BLACK,
            height: UnitManager.LINE_HEIGHT,
          ),
          SingleChildScrollView(
            child: MyText(
              text: widget.text,
              color: ColorManager.SECONDARY_COLOR,
              textHierarchy: TextHierarchy.bodySmall,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
