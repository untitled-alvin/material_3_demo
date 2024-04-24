// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'space.dart';

class TokenScreen extends StatelessWidget {
  const TokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Theme.of(context).colorScheme.shadow;
    Color surfaceTint = Theme.of(context).colorScheme.primary;

    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 0),
              child: Text(
                'Space',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          ElevationGrid(surfaceTintColor: surfaceTint),
          // SliverList(
          //   delegate: SliverChildListDelegate(<Widget>[
          //     const SizedBox(height: 10),
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
          //       child: Text(
          //         'Surface Tint Color and Shadow Color',
          //         style: Theme.of(context).textTheme.titleLarge,
          //       ),
          //     ),
          //   ]),
          // ),
          // ElevationGrid(
          //   shadowColor: shadowColor,
          //   surfaceTintColor: surfaceTint,
          // ),
          // SliverList(
          //   delegate: SliverChildListDelegate(<Widget>[
          //     const SizedBox(height: 10),
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
          //       child: Text(
          //         'Shadow Color Only',
          //         style: Theme.of(context).textTheme.titleLarge,
          //       ),
          //     ),
          //   ]),
          // ),
          // ElevationGrid(shadowColor: shadowColor),
        ],
      ),
    );
  }
}

const double narrowScreenWidthThreshold = 450;

class ElevationGrid extends StatelessWidget {
  const ElevationGrid({super.key, this.surfaceTintColor});

  final Color? surfaceTintColor;

  List<ElevationCard> elevationCards(Color? surfaceTintColor) {
    return elevations
        .map((elevationInfo) => ElevationCard(info: elevationInfo))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverLayoutBuilder(builder: (context, constraints) {
        return SliverList.list(children: elevationCards(surfaceTintColor));

        // if (constraints.crossAxisExtent < narrowScreenWidthThreshold) {
        //   return SliverGrid.count(
        //     crossAxisCount: 3,
        //     children: elevationCards(shadowColor, surfaceTintColor),
        //   );
        // } else {
        //   return SliverGrid.count(
        //     crossAxisCount: 6,
        //     children: elevationCards(shadowColor, surfaceTintColor),
        //   );
        // }
      }),
    );
  }
}

class ElevationCard extends StatefulWidget {
  const ElevationCard({super.key, required this.info});

  final ElevationInfo info;

  @override
  State<ElevationCard> createState() => _ElevationCardState();
}

class _ElevationCardState extends State<ElevationCard> {
  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(4.0));

    // return ListTile(
    //   title: Container(
    //     width: widget.info.height,
    //     height: 24,
    //     color: Colors.amber,
    //     // child: Card(
    //     //   // borderRadius: borderRadius,
    //     //   shape: RoundedRectangleBorder(),
    //     //   elevation: _elevation,
    //     //   color: color,
    //     //   shadowColor: widget.shadowColor,
    //     //   surfaceTintColor: widget.surfaceTint,
    //     //   // child: SizedBox(width: widget.info.height, height: 24),
    //     // ),
    //   ),
    // );

    final size = Size.square(widget.info.height);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Expanded(child: Text(widget.info.key.toString())),
        // Text(widget.info.height.toString()),
        // const SizedBox(width: 24),
        // const Icon(Icons.circle),
        Expanded(child: Text(widget.info.key.toString())),
        const SizedBox(width: 24),

        Expanded(
          flex: 2,
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints.tight(size),
                // width: widget.info.height,
                // height: 24,
                color: Colors.red,
                // child: Card(
                //   // borderRadius: borderRadius,
                //   shape: RoundedRectangleBorder(),
                //   elevation: _elevation,
                //   color: color,
                //   shadowColor: widget.shadowColor,
                //   surfaceTintColor: widget.surfaceTint,
                //   // child: SizedBox(width: widget.info.height, height: 24),
                // ),
              ),
            ],
          ),
        ),
        Expanded(child: Text(widget.info.height.toString())),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),

        // Expanded(child: Text(widget.info.height.toString())),

        // const Icon(Icons.circle),
      ]),
    );
  }
}

class ElevationInfo {
  const ElevationInfo({required this.height, this.key});
  final String? key;
  final double height;
}

// const List<ElevationInfo> elevations = <ElevationInfo>[
//   ElevationInfo(0, 0.0, 0),
//   ElevationInfo(1, 1.0, 5),
//   ElevationInfo(2, 3.0, 8),
//   ElevationInfo(3, 6.0, 11),
//   ElevationInfo(4, 8.0, 12),
//   ElevationInfo(5, 12.0, 14),
// ];

final List<ElevationInfo> elevations = Space()
    .space
    .entries
    .map((item) => ElevationInfo(height: item.value, key: item.key.toString()))
    .toList();
