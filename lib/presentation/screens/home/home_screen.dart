import 'package:flutter/material.dart';
import 'package:real_estate_app/common/constants/dimensions.dart';
import 'package:real_estate_app/presentation/widgets/features/home/top_section.dart';
import '../../widgets/features/home/bottom_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _numValue1 = 0;
  int _numValue2 = 0;
  bool _animateText = false;
  bool _hideCircle = false;

  @override
  void initState() {
    numbersFunction();
    animateBreadth();
    hideCircularWidget();
    super.initState();
  }

  void numbersFunction() {
    Future.delayed(const Duration(milliseconds: 1800), () {
      setState(() {
        _numValue1 = 1034;
        _numValue2 = 2212;
      });
    });
  }

  void animateBreadth() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() {
        _animateText = true;
      });
    });
  }

  void hideCircularWidget() {
    Future.delayed(const Duration(milliseconds: 2600), () {
      setState(() {
        _hideCircle = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeViewTopSection(
              expandText: _animateText,
              hideCircleRow: _hideCircle,
            ).padSymmetric(horizontal: 15, vertical: 10),
            SecondSectionHomeView(
              numValue1: _numValue1,
              numValue2: _numValue2,
              hideCircleRow: _hideCircle,
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
