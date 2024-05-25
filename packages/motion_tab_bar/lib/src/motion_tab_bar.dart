// ignore_for_file: public_member_api_docs, avoid_dynamic_calls, constant_identifier_names, lines_longer_than_80_chars, always_use_package_imports, prefer_asserts_with_message

import 'package:flutter/material.dart';

import 'half_clipper.dart';
import 'half_painter.dart';
import 'motion_tab_bar_controller.dart';
import 'motion_tab_item.dart';

typedef MotionTabBuilder = Widget Function();

class MotionTabBar extends StatefulWidget {
  MotionTabBar({
    required this.initialSelectedTab,
    required this.labels,
    this.textStyle,
    this.tabIconColor = Colors.black,
    this.tabIconSize = 24,
    this.tabIconSelectedColor = Colors.white,
    this.tabIconSelectedSize = 24,
    this.tabSelectedColor = Colors.black,
    this.tabBarColor = Colors.white,
    this.tabBarHeight = 65,
    this.tabSize = 60,
    this.onTabItemSelected,
    this.icons,
    this.useSafeArea = true,
    this.badges,
    this.controller,
    super.key,
  })  : assert(labels.contains(initialSelectedTab)),
        assert(icons != null && icons.length == labels.length),
        assert(
          // ignore: avoid_bool_literals_in_conditional_expressions
          (badges != null && badges.isNotEmpty)
              ? badges.length == labels.length
              : true,
        );

  final Color? tabIconColor;
  final Color? tabIconSelectedColor;
  final Color? tabSelectedColor;
  final Color? tabBarColor;

  final double? tabIconSize;
  final double? tabIconSelectedSize;
  final double? tabBarHeight;
  final double? tabSize;

  final TextStyle? textStyle;
  final Function? onTabItemSelected;
  final String initialSelectedTab;

  final List<String?> labels;
  final List<IconData>? icons;
  final bool useSafeArea;
  final MotionTabBarController? controller;

  // badge
  final List<Widget?>? badges;

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

  late List<String?> labels;
  late Map<String?, IconData> icons;

  int get tabAmount => icons.keys.length;
  int get index => labels.indexOf(selectedTab);

  double fabIconAlpha = 1;
  IconData? activeIcon;
  String? selectedTab;

  bool isRtl = false;
  List<Widget>? badges;
  Widget? activeBadge;

  double getPosition({required bool isRTL}) {
    final pace = 2 / (labels.length - 1);
    var position = (pace * index) - 1;

    if (isRTL) {
      // If RTL, reverse the position calculation
      position = 1 - (pace * index);
    }

    return position;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isRtl = Directionality.of(context).index == 0;
    });

    if (widget.controller != null) {
      widget.controller!.onTabChange = (index) {
        setState(() {
          activeIcon = widget.icons![index];
          selectedTab = widget.labels[index];
        });
        _initAnimationAndStart(
          _positionAnimation.value,
          getPosition(isRTL: isRtl),
        );
      };
    }
    labels = widget.labels;
    icons = {
      for (final label in labels) label: widget.icons![labels.indexOf(label)],
    };

    selectedTab = widget.initialSelectedTab;
    activeIcon = icons[selectedTab];

    // init badge text
    final selectedIndex =
        labels.indexWhere((element) => element == widget.initialSelectedTab);
    activeBadge = (widget.badges != null && widget.badges!.isNotEmpty)
        ? widget.badges![selectedIndex]
        : null;

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
          setState(() {
            activeIcon = icons[selectedTab];
            final selectedIndex =
                labels.indexWhere((element) => element == selectedTab);
            activeBadge = (widget.badges != null && widget.badges!.isNotEmpty)
                ? widget.badges![selectedIndex]
                : null;
          });
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
  Widget build(BuildContext context) {
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
          children: <Widget>[
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
                      children: <Widget>[
                        SizedBox(
                          height: widget.tabSize! + 30,
                          width: widget.tabSize! + 30,
                          child: ClipRect(
                            clipper: HalfClipper(),
                            child: Center(
                              child: Container(
                                width: widget.tabSize! + 10,
                                height: widget.tabSize! + 10,
                                decoration: BoxDecoration(
                                  color: widget.tabBarColor,
                                  shape: BoxShape.circle,
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
                        SizedBox(
                          height: widget.tabSize! + 15,
                          width: widget.tabSize! + 35,
                          child: CustomPaint(
                            painter: HalfPainter(color: widget.tabBarColor),
                          ),
                        ),
                        SizedBox(
                          height: widget.tabSize,
                          width: widget.tabSize,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.tabSelectedColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.zero,
                              child: Opacity(
                                opacity: fabIconAlpha,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      activeIcon,
                                      color: widget.tabIconSelectedColor,
                                      size: widget.tabIconSelectedSize,
                                    ),
                                    if (activeBadge != null)
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: activeBadge!,
                                      )
                                    else
                                      const SizedBox(),
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  }

  List<Widget> generateTabItems() {
    final isRtl = Directionality.of(context).index == 0;
    return labels.map((tabLabel) {
      final icon = icons[tabLabel];

      final selectedIndex = labels.indexWhere((element) => element == tabLabel);
      final badge = (widget.badges != null && widget.badges!.isNotEmpty)
          ? widget.badges![selectedIndex]
          : null;

      return MotionTabItem(
        selected: selectedTab == tabLabel,
        iconData: icon,
        title: tabLabel,
        textStyle: widget.textStyle ?? const TextStyle(color: Colors.black),
        tabIconColor: widget.tabIconColor ?? Colors.black,
        tabIconSize: widget.tabIconSize,
        badge: badge,
        callbackFunction: () {
          setState(() {
            activeIcon = icon;
            selectedTab = tabLabel;
            widget.onTabItemSelected!(index);
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
