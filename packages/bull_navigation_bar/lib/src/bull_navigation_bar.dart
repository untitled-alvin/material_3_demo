// ignore_for_file: always_use_package_imports, inference_failure_on_function_return_type, public_member_api_docs, lines_longer_than_80_chars, prefer_int_literals, cascade_invocations

import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

import 'tab_item.dart';

typedef BullNavigationSelectedCallback = Function(int? selectedPos);

/// {@template bull_navigation_bar}
/// Bull Navigation Bar Flutter package
/// {@endtemplate}
class BullNavigationBar extends StatefulWidget {
  /// {@macro bull_navigation_bar}
  BullNavigationBar(
    this.tabItems, {
    super.key,
    this.selectedPos = 0,
    this.barHeight = 60,
    Color? barBackgroundColor,
    this.barBackgroundGradient,
    this.circleSize = 58,
    this.circleStrokeWidth = 4,
    this.iconsSize = 32,
    this.selectedIconColor = Colors.white,
    this.normalIconColor = Colors.grey,
    this.animationDuration = const Duration(milliseconds: 300),
    this.selectedCallback,
    this.controller,
    this.allowSelectedIconCallback = false,
    List<BoxShadow>? backgroundBoxShadow,
  })  : backgroundBoxShadow = backgroundBoxShadow ??
            [const BoxShadow(color: Colors.grey, blurRadius: 2.0)],
        barBackgroundColor =
            (barBackgroundGradient == null && barBackgroundColor == null)
                ? Colors.white
                : barBackgroundColor,
        assert(
          barBackgroundColor == null || barBackgroundGradient == null,
          "Both barBackgroundColor and barBackgroundGradient can't be not null.",
        ),
        assert(tabItems.isNotEmpty, 'tabItems is required');

  final List<TabItem> tabItems;
  final int selectedPos;
  final double barHeight;
  final Color? barBackgroundColor;
  final Gradient? barBackgroundGradient;
  final double circleSize;
  final double circleStrokeWidth;
  final double iconsSize;
  final Color selectedIconColor;
  final Color normalIconColor;
  final Duration animationDuration;
  final List<BoxShadow>? backgroundBoxShadow;
  final BullNavigationSelectedCallback? selectedCallback;
  final BullNavigationBarController? controller;

  /// If true, allows a selected tab icon to execute its callback even if it's
  /// already selected.
  final bool allowSelectedIconCallback;

  @override
  State<StatefulWidget> createState() => _BullNavigationBarState();
}

class _BullNavigationBarState extends State<BullNavigationBar>
    with TickerProviderStateMixin {
  final Curve _animationsCurve = const Cubic(0.27, 1.21, .77, 1.09);

  late AnimationController itemsController;
  late Animation<double> selectedPosAnimation;
  late Animation<double> itemsAnimation;

  late List<double> _itemsSelectedState;

  int? selectedPos;
  int? previousSelectedPos;

  BullNavigationBarController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller;
      previousSelectedPos = selectedPos = _controller!.value;
    } else {
      previousSelectedPos = selectedPos = widget.selectedPos;
      _controller = BullNavigationBarController(selectedPos);
    }

    _controller!.addListener(_newSelectedPosNotify);

    _itemsSelectedState = List.generate(widget.tabItems.length, (index) {
      return selectedPos == index ? 1.0 : 0.0;
    });

    itemsController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    itemsController.addListener(() {
      setState(() {
        _itemsSelectedState.asMap().forEach((i, value) {
          if (i == previousSelectedPos) {
            _itemsSelectedState[previousSelectedPos!] =
                1.0 - itemsAnimation.value;
          } else if (i == selectedPos) {
            _itemsSelectedState[selectedPos!] = itemsAnimation.value;
          } else {
            _itemsSelectedState[i] = 0.0;
          }
        });
      });
    });

    selectedPosAnimation = makeSelectedPosAnimation(
      selectedPos!.toDouble(),
      selectedPos!.toDouble(),
    );

    itemsAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: itemsController, curve: _animationsCurve),
    );
  }

  Animation<double> makeSelectedPosAnimation(double begin, double end) {
    return Tween(begin: begin, end: end).animate(
      CurvedAnimation(parent: itemsController, curve: _animationsCurve),
    );
  }

  void onSelectedPosAnimate() {
    setState(() {});
  }

  void _newSelectedPosNotify() {
    _setSelectedPos(widget.controller!.value);
  }

  @override
  Widget build(BuildContext context) {
    final maxShadowHeight = (widget.backgroundBoxShadow ?? []).isNotEmpty
        ? widget.backgroundBoxShadow!.map((e) => e.blurRadius).reduce(max)
        : 0.0;
    final fullWidth = MediaQuery.of(context).size.width;
    final fullHeight = widget.barHeight +
        (widget.circleSize / 2) +
        widget.circleStrokeWidth +
        maxShadowHeight;
    final sectionsWidth = fullWidth / widget.tabItems.length;
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    //Create the boxes Rect
    final boxes = <Rect>[];
    widget.tabItems.asMap().forEach((i, tabItem) {
      final left =
          isRTL ? fullWidth - (i + 1) * sectionsWidth : i * sectionsWidth;
      final top = fullHeight - widget.barHeight;
      final right = left + sectionsWidth;
      final bottom = fullHeight;
      boxes.add(Rect.fromLTRB(left, top, right, bottom));
    });

    final children = <Widget>[];

    // This is the full view transparent background (have free space for circle)
    children.add(
      SizedBox(
        width: fullWidth,
        height: fullHeight,
      ),
    );

    // This is the bar background (bottom section of our view)
    children.add(
      Positioned(
        top: fullHeight - widget.barHeight,
        left: 0,
        child: Container(
          width: fullWidth,
          height: widget.barHeight,
          decoration: BoxDecoration(
            color: widget.barBackgroundColor,
            gradient: widget.barBackgroundGradient,
            boxShadow: widget.backgroundBoxShadow,
          ),
        ),
      ),
    );

    // This is the circle handle
    children.add(
      Positioned(
        left: isRTL
            ? fullWidth -
                ((selectedPosAnimation.value * sectionsWidth) +
                    (sectionsWidth / 2) +
                    (widget.circleSize / 2))
            : (selectedPosAnimation.value * sectionsWidth) +
                (sectionsWidth / 2) -
                (widget.circleSize / 2),
        top: maxShadowHeight,
        child: SizedBox(
          width: widget.circleSize,
          height: widget.circleSize,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(widget.circleSize / 2),
                          topRight: Radius.circular(widget.circleSize / 2),
                        ),
                        color:
                            widget.tabItems[selectedPos!].circleStrokeColor ??
                                widget.barBackgroundColor,
                        boxShadow: widget.backgroundBoxShadow,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(widget.circleSize / 2),
                          bottomRight: Radius.circular(widget.circleSize / 2),
                        ),
                        color:
                            widget.tabItems[selectedPos!].circleStrokeColor ??
                                widget.barBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(widget.circleStrokeWidth),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.tabItems[selectedPos!].circleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    //Here are the Icons and texts of items
    boxes.asMap().forEach((int pos, Rect r) {
      // Icon
      final iconColor = pos == selectedPos
          ? widget.selectedIconColor
          : widget.normalIconColor;
      final scaleFactor = pos == selectedPos ? 1.2 : 1.0;
      children.add(
        Positioned(
          left: r.center.dx - (widget.iconsSize / 2),
          top: r.center.dy -
              (widget.iconsSize / 2) -
              (_itemsSelectedState[pos] *
                  ((widget.barHeight / 2) + widget.circleStrokeWidth)),
          child: Transform.scale(
            scale: scaleFactor,
            child: Icon(
              widget.tabItems[pos].icon,
              size: widget.iconsSize,
              color: iconColor,
            ),
          ),
        ),
      );

      // Text
      final textHeight = fullHeight - widget.circleSize;
      var opacity = _itemsSelectedState[pos];
      if (opacity < 0.0) {
        opacity = 0.0;
      } else if (opacity > 1.0) {
        opacity = 1.0;
      }
      children.add(
        Positioned(
          left: r.left,
          top: r.top +
              (widget.circleSize / 2) -
              (widget.circleStrokeWidth * 2) +
              ((1.0 - _itemsSelectedState[pos]) * textHeight),
          child: SizedBox(
            width: r.width,
            height: textHeight,
            child: Center(
              child: Opacity(
                opacity: opacity,
                child: Text(
                  widget.tabItems[pos].title,
                  textAlign: TextAlign.center,
                  style: widget.tabItems[pos].labelStyle,
                ),
              ),
            ),
          ),
        ),
      );

      if (pos != selectedPos) {
        children.add(
          Positioned.fromRect(
            rect: r,
            child: GestureDetector(
              onTap: () {
                _controller!.value = pos;
              },
            ),
          ),
        );
      } else if (widget.allowSelectedIconCallback == true) {
        final selectedRect = Rect.fromLTWH(r.left, 0, r.width, fullHeight);
        children.add(
          Positioned.fromRect(
            rect: selectedRect,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(40.0)),
              child: GestureDetector(onTap: _selectedCallback),
            ),
          ),
        );
      }
    });

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: children,
      ),
    );
  }

  void _setSelectedPos(int? pos) {
    previousSelectedPos = selectedPos;
    selectedPos = pos;

    itemsController.forward(from: 0.0);

    selectedPosAnimation = makeSelectedPosAnimation(
      previousSelectedPos!.toDouble(),
      selectedPos!.toDouble(),
    );
    selectedPosAnimation.addListener(onSelectedPosAnimate);

    _selectedCallback();
  }

  void _selectedCallback() {
    if (widget.selectedCallback != null) {
      widget.selectedCallback!.call(selectedPos);
    }
  }

  @override
  void dispose() {
    super.dispose();
    itemsController.dispose();
    _controller!.removeListener(_newSelectedPosNotify);
  }
}

class BullNavigationBarController extends ValueNotifier<int?> {
  BullNavigationBarController(super.value);
}
