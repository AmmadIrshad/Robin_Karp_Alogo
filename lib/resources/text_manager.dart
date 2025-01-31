class TextManager {
  //for home screen
  static const String HOME_TITLE = ' Rabin-Karp Comparison %';
  static const String HOME_CAPTION =
      'Take a picture containing text objects to perform image-to-text conversion.';
  static const String HOME_TAKE_PICTURE_BUTTON = 'Take Picture';
  static const String HOME_COMPARE_BUTTON_RABIN_KARP = 'Compare with RK';
  static const String HOME_COMPARE_BUTTON = 'Calcute accuracy';
  static const String HOME_COMPARE_BUTTON_NAIVE_BASE = 'Compare with NB';
  static const String HOME_EXPLANATION =
      'Compare the converted text with the tester text to see the conversion accuracy.';
  static const String HOME_EXPLANATION_RK_NB =
      'Compare the converted text with the tester text to see the pattern, execution time and Comparisons.';
  static const String CONVERT_TEXT_BOX_TITLE = 'Conversion Result';
  static const String TESTER_TEXT_BOX_TITLE = 'Tester Text';
  static const String SAMPLE_TEXT = 'Sample Text';
  static const String SAMPLE_PATTERN = 'Sample pattern';
  static const String CONVERT_TEXT_BOX_HINT =
      'Take a picture to perform text conversion.';
  static const String TESTER_TEXT_BOX_HINT = 'Enter text for testing.';

  //for about screen
  static const String ABOUT_TITLE = 'Text Me Up';
  static const String STRING_MATCHING_TITLE = "String Matching Algorithms";
  static const String STRING_MATCHING_DESCRIPTION = "xyz";
  static const String STRING_MATCHING_COMPARE_BUTTON = "Button";
  static const String VERSION = 'V.1.0';
  // static const String DESCRIPTION =
  //     'An application for converting images to text and comparing the accuracy of two texts using the Rabin-Karp algorithm.';
  static const String DESCRIPTION =
      'This application offers two primary functions: first, it converts images to text and compares the extracted text with user-provided input using the Rabin-Karp algorithm to assess accuracy. Second, it incorporates two string matching algorithms—Naive and Rabin-Karp. While the Naive approach is suitable for small texts, the Rabin-Karp algorithm excels with larger texts, leveraging its hashing technique for more efficient matching.';
  static const String MADE_BY_LABEL = 'Created by:';
  static const String MADE_BY_NAME =
      'Ammad Irshad & Hashir Saud & Muhammad Farhan';

  //for bottom navigation bar
  static const String HOME_NAV_BAR_LABEL = 'RK accuracy';
  static const String RK_NAV_BAR_LABEL = 'RK & NB ';
  static const String About_NAV_BAR_LABEL = 'About ';

  //for preview screen
  static const String CROP_BUTTON = 'Crop';
  static const String CONVERT_BUTTON = 'Convert';
  static const String PREVIEW_TITLE = 'Image Preview';

  //for internet connection lost
  static const String LOST_CONNECTION = 'Oops, No Internet Connection';

  //for cropper screen
  static const String CROPPER_TITLE = 'Cropper';
}
