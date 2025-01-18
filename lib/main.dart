import 'package:flutter/material.dart';
import 'package:flutter_robin_karp_algorithm_app/controller/about_controller.dart';
import 'package:flutter_robin_karp_algorithm_app/controller/camera_controller.dart';
import 'package:flutter_robin_karp_algorithm_app/controller/cropper_controller.dart';
import 'package:flutter_robin_karp_algorithm_app/controller/home_controller.dart';
import 'package:flutter_robin_karp_algorithm_app/controller/preview_controller.dart';
import 'package:flutter_robin_karp_algorithm_app/controller/splash_controller.dart';
import 'package:flutter_robin_karp_algorithm_app/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AboutController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CameraController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CropperController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PreviewController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
