import 'package:flutter/material.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/color_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/text_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/resources/unit_manager.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/spacer.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/text_hierarchy.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_bottom_navigation_bar.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_text.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(UnitManager.SCREEN_PADDING),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo/text_me_up_logo.png',
                  width: 164.0,
                  height: 95.0,
                ),
                20.0.vSpace,
                const MyText(
                  //text: TextManager.ABOUT_TITLE,
                  text: 'DESCRIPTION',
                  color: ColorManager.BLACK,
                  textHierarchy: TextHierarchy.display,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                20.0.vSpace,
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Text Extraction & Comparison:\n\n ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'It converts images to text and compares the extracted text with user-provided input using the Rabin-Karp algorithm to assess accuracy.\n\n',
                      ),
                      TextSpan(
                        text: 'String Matching Algorithms:\n\n ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'The app incorporates two string matching algorithms—Naive and Rabin-Karp. While the Naive approach is suitable for small texts, the Rabin-Karp algorithm excels with larger texts, leveraging its hashing technique for more efficient matching.',
                      ),
                    ],
                  ),
                ),
                36.0.vSpace,
                const MyText(
                  text: TextManager.MADE_BY_LABEL,
                  color: ColorManager.BLACK,
                  textHierarchy: TextHierarchy.bodyLarge,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const MyText(
                  text: TextManager.MADE_BY_NAME,
                  color: ColorManager.BLACK,
                  textHierarchy: TextHierarchy.bodyLarge,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_robin_karp_algorithm_app/resources/color_manager.dart';
// import 'package:flutter_robin_karp_algorithm_app/resources/text_manager.dart';
// import 'package:flutter_robin_karp_algorithm_app/resources/unit_manager.dart';
// import 'package:flutter_robin_karp_algorithm_app/utils/spacer.dart';
// import 'package:flutter_robin_karp_algorithm_app/utils/text_hierarchy.dart';
// import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_bottom_navigation_bar.dart';
// import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_text.dart';

// class AboutScreen extends StatefulWidget {
//   const AboutScreen({super.key});

//   @override
//   State<AboutScreen> createState() => _AboutScreenState();
// }

// class _AboutScreenState extends State<AboutScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 2),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(UnitManager.SCREEN_PADDING),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset(
//                   'assets/logo/text_me_up_logo.png',
//                   width: 164.0,
//                   height: 154.0,
//                 ),
//                 20.0.vSpace,
//                 const MyText(
//                   text: 'DESCRIPTION',
//                   color: ColorManager.BLACK,
//                   textHierarchy: TextHierarchy.display,
//                   fontWeight: FontWeight.w700,
//                   textAlign: TextAlign.center,
//                 ),
//                 20.0.vSpace,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: const TextSpan(
//                       style: TextStyle(fontSize: 16, color: Colors.black),
//                       children: [
//                         TextSpan(
//                           text: 'Text Extraction & Comparison:\n ',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         TextSpan(
//                           text:
//                               'It converts images to text and compares the extracted text with user-provided input using the Rabin-Karp algorithm to assess accuracy.\n\n',
//                         ),
//                         TextSpan(
//                           text: 'String Matching Algorithms:\n ',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         TextSpan(
//                           text:
//                               'The app incorporates two string matching algorithms—Naive and Rabin-Karp. While the Naive approach is suitable for small texts, the Rabin-Karp algorithm excels with larger texts, leveraging its hashing technique for more efficient matching.',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 36.0.vSpace,
//                 const MyText(
//                   text: TextManager.MADE_BY_LABEL,
//                   color: ColorManager.BLACK,
//                   textHierarchy: TextHierarchy.bodyLarge,
//                   fontWeight: FontWeight.w700,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 10),
//                 const MyText(
//                   text: TextManager.MADE_BY_NAME,
//                   color: ColorManager.BLACK,
//                   textHierarchy: TextHierarchy.bodyLarge,
//                   fontWeight: FontWeight.w400,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
