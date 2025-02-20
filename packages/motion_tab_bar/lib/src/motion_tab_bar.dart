// ignore_for_file: public_member_api_docs, avoid_dynamic_calls, constant_identifier_names, lines_longer_than_80_chars, always_use_package_imports, prefer_asserts_with_message, avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';

import 'half_clipper.dart';
import 'half_painter.dart';
import 'motion_tab_bar_controller.dart';
import 'motion_tab_item.dart';

final indicator = BoxDecoration(
  // color: widget.tabBarColor,
  borderRadius: const BorderRadius.all(Radius.circular(12)),
  color: Colors.red,
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.amberAccent.shade200,
      Colors.amberAccent.shade700,
    ],
  ),
  boxShadow: const [
    BoxShadow(color: Colors.black12, blurRadius: 8),
  ],
);

typedef MotionTabBuilder = Widget Function();

class MotionTabBar extends StatefulWidget {
  MotionTabBar({
    required this.initialIndex,
    required this.labels,
    this.textStyle,
    this.tabIconColor = Colors.black,
    this.tabIconSize = 24,
    this.tabIconSelectedColor = Colors.white,
    this.tabIconSelectedSize = 24,
    this.tabSelectedColor = Colors.black,
    this.tabBarColor = Colors.white,
    this.tabBarHeight = 80,
    this.tabSize = 64,
    // this.tabBarHeight = 65,
    // this.tabSize = 60,
    this.icons,
    this.useSafeArea = true,
    this.badges,
    this.controller,
    this.onTabSelected,
    this.shapes,
    super.key,
  })  : assert(icons != null && icons.length == labels.length),
        assert(
          badges?.isNotEmpty ?? false ? badges!.length == labels.length : true,
        );

  final double tabBarHeight;
  final double tabSize;

  final Color? tabIconColor;
  final Color? tabIconSelectedColor;
  final Color? tabSelectedColor;
  final Color? tabBarColor;

  final double? tabIconSize;
  final double? tabIconSelectedSize;

  final TextStyle? textStyle;
  final int initialIndex;

  final List<String?> labels;
  final List<Widget>? icons;

  final bool useSafeArea;
  final MotionTabBarController? controller;
  final void Function(int)? onTabSelected;

  // badge
  final List<Widget?>? badges;
  final List<BorderRadius>? shapes;

  @override
  State<MotionTabBar> createState() => _MotionTabBarState();
}

class _MotionTabBarState extends State<MotionTabBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Tween<double> _positionTween;
  late Animation<double> _positionAnimation;

  late AnimationController _fadeOutController;
  late Animation<double> _fadeFabOutAnimation;
  late Animation<double> _fadeFabInAnimation;

  List<String?> get labels => widget.labels;
  List<Widget?>? get badges => widget.badges;
  bool get isBadgesNotEmpty => badges?.isNotEmpty ?? false;
  Widget? get activeIcon => widget.icons?[selectedIndex];
  Widget? get activeBadge => widget.badges?[selectedIndex];
  BorderRadius? get radius => widget.shapes?[selectedIndex];
  int get tabAmount => labels.length;

  // int get tabAmount => widget.icons?.length ?? 0;
  // int get tabAmount => icons.keys.length;

  int selectedIndex = 0;
  double fabIconAlpha = 1;
  bool isRtl = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isRtl = Directionality.of(context).index == 0;
    });

    selectedIndex = widget.initialIndex;

    if (widget.controller != null) {
      widget.controller!.onTabChange = (index) {
        setState(() {
          selectedIndex = index;
        });
        _initAnimationAndStart(
          _positionAnimation.value,
          getPosition(isRTL: isRtl),
        );
      };
    }

    _animationController = AnimationController(
      duration: const Duration(milliseconds: ANIM_DURATION),
      vsync: this,
    );

    _fadeOutController = AnimationController(
      duration: const Duration(milliseconds: ANIM_DURATION ~/ 5),
      vsync: this,
    );

    _positionTween = Tween<double>(begin: getPosition(isRTL: isRtl), end: 1);

    _positionAnimation = _positionTween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {});
      });

    _fadeFabOutAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut),
    )
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabOutAnimation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {});
        }
      });

    _fadeFabInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.8, 1, curve: Curves.easeOut),
      ),
    )..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabInAnimation.value;
        });
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final fabSize = widget.tabSize! + 10;
    final tabSize = widget.tabSize;
    final fabSize = tabSize + 12;

    return Container(
      decoration: BoxDecoration(
        color: widget.tabBarColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -1),
            blurRadius: 5,
          ),
        ],
      ),
      child: SafeArea(
        bottom: widget.useSafeArea,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: widget.tabBarHeight,
              decoration: BoxDecoration(
                color: widget.tabBarColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: generateTabItems(),
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Align(
                  heightFactor: 0,
                  alignment: Alignment(_positionAnimation.value, 0),
                  child: FractionallySizedBox(
                    widthFactor: 1 / tabAmount,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // SizedBox(
                        //   height: widget.tabSize + 30,
                        //   width: widget.tabSize + 30,
                        //   child: ClipRect(
                        //     clipper: HalfClipper(),
                        //     child: Center(
                        //       child: Container(
                        //         width: widget.tabSize + 10,
                        //         height: widget.tabSize + 10,
                        //         decoration: BoxDecoration(
                        //           color: widget.tabBarColor,
                        //           shape: BoxShape.circle,
                        //           boxShadow: const [
                        //             BoxShadow(
                        //               color: Colors.black12,
                        //               blurRadius: 8,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        SizedBox.square(
                          dimension: fabSize + 32,
                          // dimension: widget.tabSize! + 30,
                          child: ClipRect(
                            // clipper: HalfClipper(),
                            child: Center(
                              child: AnimatedContainer(
                                width: fabSize,
                                height: fabSize,
                                curve: Curves.fastOutSlowIn,
                                // height: widget.tabSize! + 10,
                                // width: widget.tabSize! + 10,
                                duration: Durations.medium1,
                                decoration: BoxDecoration(
                                  color: widget.tabBarColor,
                                  borderRadius: radius,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        //
                        // SizedBox.square(
                        //   // height: widget.tabSize! + 15,
                        //   // width: widget.tabSize! + 35,
                        //   dimension: tabSize + 20,
                        //   // height: tabSize + 16,
                        //   // width: tabSize + 36,
                        //   child: CustomPaint(
                        //     painter: HalfPainter(color: widget.tabBarColor),
                        //   ),
                        // ),
                        SizedBox.square(
                          dimension: tabSize,
                          child: AnimatedContainer(
                            duration: Durations.medium1,
                            padding: EdgeInsets.zero,
                            curve: Curves.fastOutSlowIn,
                            decoration: BoxDecoration(
                              borderRadius: radius,
                              color: widget.tabSelectedColor,
                            ),
                            child: Opacity(
                              opacity: 1,
                              // opacity: fabIconAlpha,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (activeIcon != null)
                                    IconTheme(
                                      data: IconThemeData(
                                        size: widget.tabIconSelectedSize,
                                        color: widget.tabIconSelectedColor,
                                      ),
                                      child: activeIcon!,
                                    ),

                                  //
                                  if (activeBadge != null)
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: activeBadge!,
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Indicator
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Align(
                heightFactor: 0,
                // alignment: Alignment.topRight,
                // alignment: Alignment(_positionAnimation.value, 0),
                alignment: Alignment(
                  _positionAnimation.value,
                  // -1.7,
                  // -8,
                  // -(widget.tabSize! / 2),
                  // 20,
                  // 21.8,
                  -(widget.tabBarHeight / 2) + 1,
                  // -(widget.tabSize! + 4) / 2,
                ),
                child: FractionallySizedBox(
                  widthFactor: 1 / tabAmount,
                  child: Container(
                    height: 4,
                    // width: widget.tabSize,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(decoration: indicator),
                  ),
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }

  double getPosition({required bool isRTL}) {
    final pace = 2 / (labels.length - 1);
    var position = (pace * selectedIndex) - 1;

    if (isRTL) {
      // If RTL, reverse the position calculation
      position = 1 - (pace * selectedIndex);
    }

    return position;
  }

  List<Widget> generateTabItems() {
    final isRtl = Directionality.of(context).index == 0;

    return labels.map((label) {
      final index = labels.indexOf(label);
      final icon = widget.icons?[index];
      final badge = isBadgesNotEmpty ? badges![index] : null;

      return MotionTabItem(
        selected: selectedIndex == index,
        icon: icon,
        title: label,
        textStyle: widget.textStyle ?? const TextStyle(color: Colors.black),
        tabIconColor: widget.tabIconColor ?? Colors.black,
        tabIconSize: widget.tabIconSize,
        badge: badge,
        onPressed: () {
          setState(() {
            selectedIndex = index;
            widget.onTabSelected!(index);
          });
          _initAnimationAndStart(
            _positionAnimation.value,
            getPosition(isRTL: isRtl),
          );
        },
      );
    }).toList();
  }

  void _initAnimationAndStart(double from, double to) {
    _positionTween
      ..begin = from
      ..end = to;

    _animationController.reset();
    _fadeOutController.reset();
    _animationController.forward();
    _fadeOutController.forward();
  }
}
