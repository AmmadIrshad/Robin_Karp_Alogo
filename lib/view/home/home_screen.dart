import 'package:flutter/material.dart';
import 'package:flutter_robin_karp_algorithm_app/controller/home_controller.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/color_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/text_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/unit_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/finite_state.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/size_config.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/spacer.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/text_hierarchy.dart';
import 'package:flutter_robin_karp_algorithm_app/view/camera/camera_screen.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_bottom_navigation_bar.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_button.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_text.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_text_box.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController _provider;

  @override
  void initState() {
    _provider = Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _provider.getConvertResult();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 0),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            38.0.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16.0,
              children: <Widget>[
                Image.asset(
                  'assets/logo/text_me_up_logo.png',
                  width: getProportionateScreenWidth(89.0),
                  height: getProportionateScreenHeight(84.0),
                ),
                const MyText(
                  text: TextManager.HOME_TITLE,
                  color: ColorManager.BLACK,
                  textHierarchy: TextHierarchy.bodyLarge,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            18.0.vSpace,
            const Divider(
              color: ColorManager.SECONDARY_COLOR,
              height: UnitManager.LINE_HEIGHT,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(UnitManager.SCREEN_PADDING),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const MyText(
                      text: TextManager.HOME_CAPTION,
                      color: ColorManager.BLACK,
                      textHierarchy: TextHierarchy.bodySmall,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    40.0.vSpace,
                    MyButton(
                      isPrimaryButton: true,
                      isCropButton: false,
                      isCompare: false,
                      needElevation: true,
                      width: getProportionateScreenWidth(317.0),
                      height: getProportionateScreenHeight(72.0),
                      borderRadius: UnitManager.RADIUS_MEDIUM,
                      text: TextManager.HOME_TAKE_PICTURE_BUTTON,
                      color: ColorManager.BLACK,
                      textHierarchy: TextHierarchy.bodySmall,
                      fontWeight: FontWeight.w500,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CameraScreen(),
                        ),
                      ),
                    ),
                    23.0.vSpace,
                    Consumer<HomeController>(
                      builder: (context, value, child) {
                        if (value.finiteState == FiniteState.loading) {
                        } else if (value.finiteState == FiniteState.succeed) {
                          return MyTextBox(
                            title: TextManager.CONVERT_TEXT_BOX_TITLE,
                            text: value.convertResult == null ||
                                    value.convertResult!.text == ''
                                ? TextManager.CONVERT_TEXT_BOX_HINT
                                : value.convertResult!.text!,
                          );
                        } else if (value.finiteState == FiniteState.failed) {
                        } else {
                          return const SizedBox();
                        }
                        return const MyTextBox(
                          title: TextManager.CONVERT_TEXT_BOX_TITLE,
                          text: TextManager.CONVERT_TEXT_BOX_HINT,
                        );
                      },
                    ),
                    21.0.vSpace,
                    const MyTextBox(
                      title: TextManager.TESTER_TEXT_BOX_TITLE,
                      text: TextManager.TESTER_TEXT_BOX_HINT,
                    ),
                    21.0.vSpace,
                    const MyText(
                      text: TextManager.HOME_EXPLANATION,
                      color: ColorManager.BLACK,
                      textHierarchy: TextHierarchy.bodyMedium,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    24.0.vSpace,
                    MyButton(
                      isPrimaryButton: false,
                      isCropButton: false,
                      isCompare: true,
                      needElevation: true,
                      width: getProportionateScreenWidth(99.0),
                      height: double.infinity,
                      borderRadius: UnitManager.RADIUS_SMALL,
                      text: TextManager.HOME_COMPARE_BUTTON,
                      color: ColorManager.BLACK,
                      textHierarchy: TextHierarchy.bodyMedium,
                      fontWeight: FontWeight.w500,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
