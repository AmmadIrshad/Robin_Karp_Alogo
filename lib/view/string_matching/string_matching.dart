import 'package:flutter/material.dart';
import 'package:flutter_robin_karp_algorithm_app/controller/home_controller.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/color_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/text_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/unit_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/finite_state.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/naive_base_algorithm.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/rabin_karp_algorithm.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/size_config.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/spacer.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/text_hierarchy.dart';
import 'package:flutter_robin_karp_algorithm_app/view/camera/camera_screen.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_bottom_navigation_bar.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_button.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_text.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_text_box.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

class StringMatching extends StatefulWidget {
  const StringMatching({super.key});

  @override
  State<StringMatching> createState() => _StringMatchingState();
}

class _StringMatchingState extends State<StringMatching> {
  late final HomeController _provider;
  final TextEditingController _testerController = TextEditingController();
  final TextEditingController _conversionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> _formKeyConversionController =
  //     GlobalKey<FormState>();
  final FocusNode _testerNode = FocusNode();
  final FocusNode _conversionNode = FocusNode();

  @override
  void initState() {
    _provider = Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            38.0.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              //Spacing: 16.0,
              children: <Widget>[
                Image.asset(
                  'assets/logo/text_me_up_logo.png',
                  width: getProportionateScreenWidth(89.0),
                  height: getProportionateScreenHeight(84.0),
                ),
                const MyText(
                  text: TextManager.STRING_MATCHING_TITLE,
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
                    // const MyText(
                    //   text: TextManager.HOME_CAPTION,
                    //   color: ColorManager.BLACK,
                    //   textHierarchy: TextHierarchy.bodySmall,
                    //   fontWeight: FontWeight.w400,
                    //   textAlign: TextAlign.center,
                    // ),
                    // 40.0.vSpace,
                    // MyButton(
                    //   isPrimaryButton: true,
                    //   isCropButton: false,
                    //   isCompare: false,
                    //   needElevation: true,
                    //   width: getProportionateScreenWidth(317.0),
                    //   height: getProportionateScreenHeight(72.0),
                    //   borderRadius: UnitManager.RADIUS_MEDIUM,
                    //   text: TextManager.HOME_TAKE_PICTURE_BUTTON,
                    //   color: ColorManager.BLACK,
                    //   textHierarchy: TextHierarchy.bodySmall,
                    //   fontWeight: FontWeight.w500,
                    //   onPressed: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const CameraScreen(),
                    //     ),
                    //   ),
                    // ),
                    23.0.vSpace,
                    // Consumer<HomeController>(
                    //   builder: (context, value, child) {
                    //     if (value.finiteState == FiniteState.succeed &&
                    //         value.convertResult != null) {
                    //       return MyTextBox(
                    //         title: TextManager.SAMPLE_TEXT,
                    //         text: value.convertResult!.text!,
                    //         color: ColorManager.BLACK,
                    //       );
                    //     } else {
                    //       return MyTextField(
                    //         title: TextManager.SAMPLE_TEXT,
                    //         hint: TextManager.CONVERT_TEXT_BOX_HINT,
                    //         controller:
                    //             _conversionController, // Text controller for user input
                    //         currentFocus: _conversionNode,
                    //       );
                    //     }
                    //   },
                    // ),
                    MyTextField(
                      title: TextManager.SAMPLE_TEXT,
                      hint: TextManager.CONVERT_TEXT_BOX_HINT,
                      controller:
                          _conversionController, // Text controller for user input
                      currentFocus: _conversionNode,
                    ),
                    21.0.vSpace,
                    Form(
                      key: _formKey,
                      child: MyTextField(
                        title: TextManager.SAMPLE_PATTERN,
                        hint: TextManager.TESTER_TEXT_BOX_HINT,
                        controller: _testerController,
                        currentFocus: _testerNode,
                      ),
                    ),
                    21.0.vSpace,
                    const MyText(
                      text: TextManager.HOME_EXPLANATION_RK_NB,
                      color: ColorManager.BLACK,
                      textHierarchy: TextHierarchy.bodyMedium,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    24.0.vSpace,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //compare button for Naive Base
                          MyButton(
                            isPrimaryButton: false,
                            isCropButton: false,
                            isCompare: true,
                            needElevation: true,
                            width: getProportionateScreenWidth(99.0),
                            height: double.infinity,
                            borderRadius: UnitManager.RADIUS_SMALL,
                            text: TextManager.HOME_COMPARE_BUTTON_NAIVE_BASE,
                            color: ColorManager.BLACK,
                            textHierarchy: TextHierarchy.bodyMedium,
                            fontWeight: FontWeight.w500,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_provider.convertResult == null &&
                                    _conversionController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                      content: MyText(
                                          text:
                                              'The conversion result is still empty',
                                          color: ColorManager.WHITE,
                                          textHierarchy:
                                              TextHierarchy.bodyLarge,
                                          fontWeight: FontWeight.normal,
                                          textAlign: TextAlign.start),
                                    ),
                                  );
                                } else {
                                  // String textToSearchIn = _provider
                                  //             .convertResult
                                  //             ?.text
                                  //             ?.isNotEmpty ==
                                  //         true
                                  //     ? _provider.convertResult!.text!
                                  //     : _conversionController.text;
                                  String textToSearchIn =
                                      _conversionController.text;
                                  Map<String, dynamic> result =
                                      StringMatchingAlgorithm.stringMatching(
                                          textToSearchIn,
                                          _testerController.text);

                                  String resultText = result["matchedIndices"]
                                          .isNotEmpty
                                      ? 'Pattern found at positions: ${result["matchedIndices"].join(', ')}\n'
                                          'Comparisons: ${result["comparisons"]}'
                                      : 'No match found';

                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                        padding: const EdgeInsets.all(17.0),
                                        decoration: const BoxDecoration(
                                          color: ColorManager.SECONDARY_COLOR,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                UnitManager.RADIUS_LARGE),
                                            topRight: Radius.circular(
                                                UnitManager.RADIUS_LARGE),
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/text_me_up_bottom_sheet.png',
                                                width: 41.0,
                                                height: 38.0,
                                              ),
                                              13.0.vSpace,
                                              const MyText(
                                                text: 'Result',
                                                color: ColorManager.BLACK,
                                                textHierarchy:
                                                    TextHierarchy.display,
                                                fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.center,
                                              ),
                                              13.0.vSpace,
                                              MyText(
                                                text: resultText,
                                                color: ColorManager.BLACK,
                                                textHierarchy:
                                                    TextHierarchy.header,
                                                fontWeight: FontWeight.normal,
                                                textAlign: TextAlign.center,
                                              ),
                                              29.0.vSpace,
                                              MyButton(
                                                isPrimaryButton: false,
                                                isCropButton: false,
                                                isCompare: false,
                                                needElevation: false,
                                                width:
                                                    getProportionateScreenWidth(
                                                        88.74),
                                                height: 50,
                                                borderRadius: UnitManager
                                                    .RADIUS_EXTRA_SMALL,
                                                text: 'Ok',
                                                color: ColorManager.BLACK,
                                                textHierarchy:
                                                    TextHierarchy.bodyLarge,
                                                fontWeight: FontWeight.normal,
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                          //cpmare button for Rabin karp
                          MyButton(
                            isPrimaryButton: false,
                            isCropButton: false,
                            isCompare: true,
                            needElevation: true,
                            width: getProportionateScreenWidth(99.0),
                            height: double.infinity,
                            borderRadius: UnitManager.RADIUS_SMALL,
                            text: TextManager.HOME_COMPARE_BUTTON_RABIN_KARP,
                            color: ColorManager.BLACK,
                            textHierarchy: TextHierarchy.bodyMedium,
                            fontWeight: FontWeight.w500,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_provider.convertResult == null &&
                                    _conversionController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                      content: MyText(
                                          text:
                                              'The conversion result is still empty',
                                          color: ColorManager.WHITE,
                                          textHierarchy:
                                              TextHierarchy.bodyLarge,
                                          fontWeight: FontWeight.normal,
                                          textAlign: TextAlign.start),
                                    ),
                                  );
                                } else {
                                  // String textToSearchIn = _provider
                                  //             .convertResult
                                  //             ?.text
                                  //             ?.isNotEmpty ==
                                  //         true
                                  //     ? _provider.convertResult!.text!
                                  //     : _conversionController.text;
                                  String textToSearchIn =
                                      _conversionController.text;

                                  // Map<String, dynamic> result =
                                  // StringMatchingAlgorithm.stringMatching(
                                  //         textToSearchIn,
                                  //         _testerController.text);

                                  // String resultText = result["matchedIndices"]
                                  //         .isNotEmpty
                                  //     ? 'Pattern found at positions: ${result["matchedIndices"].join(', ')}\n'
                                  //         'Execution Time: ${result["executionTimeMs"]} ms\n'
                                  //         'Comparisons: ${result["comparisons"]}'
                                  //     : 'No match found';
                                  Map<String, dynamic> result =
                                      StringMatchingRabinKarpAlgo.rabinKarp(
                                          textToSearchIn,
                                          _testerController.text,
                                          1000000007 // Prime number for hashing
                                          );

                                  String resultText = result["matchedIndices"]
                                          .isNotEmpty
                                      ? 'Pattern found at positions: ${result["matchedIndices"].join(', ')}\n'
                                          'Comparisons: ${result["comparisons"]}'
                                      : 'No match found';

                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                        padding: const EdgeInsets.all(17.0),
                                        decoration: const BoxDecoration(
                                          color: ColorManager.SECONDARY_COLOR,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                UnitManager.RADIUS_LARGE),
                                            topRight: Radius.circular(
                                                UnitManager.RADIUS_LARGE),
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/text_me_up_bottom_sheet.png',
                                                width: 41.0,
                                                height: 38.0,
                                              ),
                                              13.0.vSpace,
                                              const MyText(
                                                text: 'Result',
                                                color: ColorManager.BLACK,
                                                textHierarchy:
                                                    TextHierarchy.display,
                                                fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.center,
                                              ),
                                              13.0.vSpace,
                                              MyText(
                                                text: resultText,
                                                color: ColorManager.BLACK,
                                                textHierarchy:
                                                    TextHierarchy.header,
                                                fontWeight: FontWeight.normal,
                                                textAlign: TextAlign.center,
                                              ),
                                              29.0.vSpace,
                                              MyButton(
                                                isPrimaryButton: false,
                                                isCropButton: false,
                                                isCompare: false,
                                                needElevation: false,
                                                width:
                                                    getProportionateScreenWidth(
                                                        88.74),
                                                height: 50,
                                                borderRadius: UnitManager
                                                    .RADIUS_EXTRA_SMALL,
                                                text: 'Ok',
                                                color: ColorManager.BLACK,
                                                textHierarchy:
                                                    TextHierarchy.bodyLarge,
                                                fontWeight: FontWeight.normal,
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        ]),
                    // //compare button
                    // MyButton(
                    //   isPrimaryButton: false,
                    //   isCropButton: false,
                    //   isCompare: true,
                    //   needElevation: true,
                    //   width: getProportionateScreenWidth(99.0),
                    //   height: double.infinity,
                    //   borderRadius: UnitManager.RADIUS_SMALL,
                    //   text: TextManager.HOME_COMPARE_BUTTON,
                    //   color: ColorManager.BLACK,
                    //   textHierarchy: TextHierarchy.bodyMedium,
                    //   fontWeight: FontWeight.w500,
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       if (_provider.convertResult == null &&
                    //           _conversionController.text.isEmpty) {
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //           const SnackBar(
                    //             behavior: SnackBarBehavior.floating,
                    //             backgroundColor: Colors.red,
                    //             content: MyText(
                    //                 text:
                    //                     'The conversion result is still empty',
                    //                 color: ColorManager.WHITE,
                    //                 textHierarchy: TextHierarchy.bodyLarge,
                    //                 fontWeight: FontWeight.normal,
                    //                 textAlign: TextAlign.start),
                    //           ),
                    //         );
                    //       } else {
                    //         String textToSearchIn =
                    //             _provider.convertResult?.text?.isNotEmpty ==
                    //                     true
                    //                 ? _provider.convertResult!.text!
                    //                 : _conversionController.text;

                    //         Map<String, dynamic> result =
                    //             StringMatchingAlgorithm.stringMatching(
                    //                 textToSearchIn, _testerController.text);

                    //         String resultText = result["matchedIndices"]
                    //                 .isNotEmpty
                    //             ? 'Pattern found at positions: ${result["matchedIndices"].join(', ')}\n'
                    //                 'Execution Time: ${result["executionTimeMs"]} ms\n'
                    //                 'Comparisons: ${result["comparisons"]}'
                    //             : 'No match found';

                    //         showModalBottomSheet(
                    //           context: context,
                    //           builder: (context) => SizedBox(
                    //             width: double.infinity,
                    //             child: Container(
                    //               padding: const EdgeInsets.all(17.0),
                    //               decoration: const BoxDecoration(
                    //                 color: ColorManager.SECONDARY_COLOR,
                    //                 borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(
                    //                       UnitManager.RADIUS_LARGE),
                    //                   topRight: Radius.circular(
                    //                       UnitManager.RADIUS_LARGE),
                    //                 ),
                    //               ),
                    //               child: SingleChildScrollView(
                    //                 child: Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                   children: [
                    //                     Image.asset(
                    //                       'assets/images/text_me_up_bottom_sheet.png',
                    //                       width: 41.0,
                    //                       height: 38.0,
                    //                     ),
                    //                     13.0.vSpace,
                    //                     const MyText(
                    //                       text: 'Accuracy of Result',
                    //                       color: ColorManager.BLACK,
                    //                       textHierarchy: TextHierarchy.display,
                    //                       fontWeight: FontWeight.bold,
                    //                       textAlign: TextAlign.center,
                    //                     ),
                    //                     13.0.vSpace,
                    //                     MyText(
                    //                       text: resultText,
                    //                       color: ColorManager.BLACK,
                    //                       textHierarchy: TextHierarchy.header,
                    //                       fontWeight: FontWeight.normal,
                    //                       textAlign: TextAlign.center,
                    //                     ),
                    //                     29.0.vSpace,
                    //                     MyButton(
                    //                       isPrimaryButton: false,
                    //                       isCropButton: false,
                    //                       isCompare: false,
                    //                       needElevation: false,
                    //                       width: getProportionateScreenWidth(
                    //                           88.74),
                    //                       height: 50,
                    //                       borderRadius:
                    //                           UnitManager.RADIUS_EXTRA_SMALL,
                    //                       text: 'Ok',
                    //                       color: ColorManager.BLACK,
                    //                       textHierarchy:
                    //                           TextHierarchy.bodyLarge,
                    //                       fontWeight: FontWeight.normal,
                    //                       onPressed: () =>
                    //                           Navigator.pop(context),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         );
                    //       }
                    //     }
                    //   },
                    // ),
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
