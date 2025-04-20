import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate_app/common/constants/dimensions.dart';
import 'package:real_estate_app/common/skin/skin.dart';
import 'package:real_estate_app/presentation/screens/home/home_screen.dart';
import 'package:real_estate_app/presentation/widgets/tap_widget.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'common/constants/nav_bar.dart';
import 'common/skin/colors.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _waveAnimation;
  bool _onHideBorder = false;
  final double _begin = 33;
  final double _end = 22;

  int _pageIndex = 2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _waveAnimation = Tween<double>(
      begin: _begin,
      end: _end,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _hideBorder();
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _hideBorder() {
    setState(() {
      _onHideBorder = false;
    });
  }

  void _onDisplayBorder() {
    setState(() {
      _onHideBorder = true;
    });
  }

  void _onTap() {
    _onDisplayBorder();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SkinData.lightSkin,
      darkTheme: SkinData.lightSkin,
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // the background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.backgroundGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            [
              // MapHomeView(),
              SizedBox(),
              SizedBox(),
              HomeScreen(),
              SizedBox(),
              SizedBox(),
            ][_pageIndex],

            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: kBottomNavigationBarHeight * 1.4,
                width: context.sizeWidth(0.82),
                child: Card(
                  color: context.colorScheme.onSurface.withOpacity(0.95),
                  shape: const StadiumBorder(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                            5,
                            (index) => TapWidget(
                          index: index,
                          onTap: () {
                            _onTap();
                            setState(() {
                              _pageIndex = index;
                            });
                          },
                          waveAnimation: _waveAnimation,
                          width: _pageIndex == index ? 55 : 47,
                          height: _pageIndex == index ? 55 : 47,
                          showWaves: _pageIndex == index,
                          onHideBorder: _onHideBorder,
                          decoration: BoxDecoration(
                            color: _pageIndex == index && !_onHideBorder
                                ? AppColors.primary
                                : _pageIndex == 0
                                ? Colors.black26
                                : context.colorScheme.onSurface,
                            shape: BoxShape.circle,
                            border: _onHideBorder && _pageIndex == index
                                ? Border.all(color: context.colorScheme.surface, width: 1)
                                : null,
                          ),
                          child: SvgPicture.asset(
                            NavBar.navIcons.values.toList()[index],
                            color: context.colorScheme.surface,
                            height: _pageIndex == index ? 28 : null,
                          ),
                        ),
                      ),
                  ),
                ),
              ).padOnly(bottom: context.sizeHeight(0.015)),
            ).slideInFromBottom(delay: 3000.ms, animationDuration: 2500.ms, begin: 0.9),
          ],
        ),
      ),
    );
  }
}
