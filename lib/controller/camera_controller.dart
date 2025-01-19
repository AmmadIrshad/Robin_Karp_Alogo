import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_robin_karp_algorithm_app/utils/finite_state.dart';

class ThisCameraController with ChangeNotifier {
  //this variable is used to store the Finite State enum
  FiniteState _finiteState = FiniteState.init;
  //this variable is used to store the image file
  File? _imagefile;

  //this is the getter of _finiteState
  FiniteState get finiteState => _finiteState;
  //this is the getter of _imageFile
  File? get imageFile => _imagefile;

  ///this function aims to change the Finite State and triggering the consumer widget
  ///
  ///created on January 18th, 2025
  void changeFiniteState({required FiniteState value}) {
    _finiteState = value;
    notifyListeners();
  }

  ///this function aims to set the image file after the picture is captured
  ///
  ///created on January 19th, 2025
  void setImageFile(File? value) {
    _imagefile = value;
    notifyListeners();
  }
}
