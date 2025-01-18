import 'package:flutter/material.dart';
import 'package:flutter_robin_karp_algorithm_app/view/widgets/my_bottom_navigation_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: 1),
    );
  }
}
