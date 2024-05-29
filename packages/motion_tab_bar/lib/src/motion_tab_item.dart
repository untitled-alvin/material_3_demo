// ignore_for_file: public_member_api_docs, avoid_dynamic_calls, constant_identifier_names, lines_longer_than_80_chars

import 'package:flutter/material.dart';

// const double ICON_OFF = -3;
// const double ICON_ON = 0;
// const double TEXT_OFF = 3;
// const double TEXT_ON = 1;
// const double ALPHA_OFF = 0;
// const double ALPHA_ON = 1;
// const int ANIM_DURATION = 300;

const double ICON_OFF = -3;
const double ICON_ON = -0.6;
const double TEXT_OFF = 1.1;
const double TEXT_ON = 0.85;
const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;
const int ANIM_DURATION = 300;

class MotionTabItem extends StatefulWidget {
  const MotionTabItem({
    required this.title,
    required this.selected,
    required this.iconData,
    required this.textStyle,
    required this.tabIconColor,
    required this.callbackFunction,
    this.tabIconSize = 24,
    this.badge,
    super.key,
  });

  final String? title;
  final bool selected;
  final IconData? iconData;
  final TextStyle textStyle;
  final Function callbackFunction;
  final Color tabIconColor;
  final double? tabIconSize;
  final Widget? badge;

  @override
  State<MotionTabItem> createState() => _MotionTabItemState();
}

class _MotionTabItemState extends State<MotionTabItem> {
  double iconYAlign = ICON_ON;
  double textYAlign = TEXT_OFF;
  double iconAlpha = ALPHA_ON;

  @override
  void initState() {
    super.initState();
    _setIconTextAlpha();
  }

  @override
  void didUpdateWidget(MotionTabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setIconTextAlpha();
  }

  void _setIconTextAlpha() {
    setState(() {
      iconYAlign = (widget.selected) ? ICON_OFF : ICON_ON;
      textYAlign = (widget.selected) ? TEXT_ON : TEXT_OFF;
      iconAlpha = (widget.selected) ? ALPHA_OFF : ALPHA_ON;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: ANIM_DURATION),
              alignment: Alignment(0, textYAlign),
              child: Padding(
                padding: const EdgeInsets.all(8),
                // child: widget.selected
                //     ? Text(
                //         widget.title!,
                //         style: widget.textStyle,
                //         softWrap: false,
                //         maxLines: 1,
                //         textAlign: TextAlign.center,
                //       )
                //     : const Text(''),
                child: Text(
                  widget.title!,
                  style: widget.textStyle,
                  softWrap: false,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => widget.callbackFunction.call(),
            child: SizedBox.expand(
              child: AnimatedAlign(
                duration: const Duration(milliseconds: ANIM_DURATION),
                curve: Curves.easeIn,
                alignment: Alignment(0, iconYAlign),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: ANIM_DURATION),
                  opacity: iconAlpha,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        // alignment: const Alignment(0, 0),
                        alignment: Alignment.center,
                        icon: Icon(
                          widget.iconData,
                          color: widget.tabIconColor,
                          size: widget.tabIconSize,
                        ),
                        onPressed: () => widget.callbackFunction.call(),
                      ),
                      if (widget.badge != null)
                        Positioned(top: 0, right: 0, child: widget.badge!)
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
    );
  }
}
