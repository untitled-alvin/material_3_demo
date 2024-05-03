// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:diversity_avatars/diversity_avatars.dart';
import 'package:flutter/material.dart';
import 'package:standard_ui_kit/standard_ui_kit.dart';

class TokenScreen extends StatelessWidget {
  const TokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color surfaceTint = Theme.of(context).colorScheme.primary;
    double totalWidth = elevations.map((e) => e.height).reduce((a, b) => a + b);

    return Expanded(
      child: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 0),
          //     child: DiversityAvatars.s01.image(),
          //   ),
          // ),

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

          SliverToBoxAdapter(
            child: SizedBox.fromSize(
              // decoration: BoxDecoration(border: Border.all()),
              size: Size(totalWidth, 36),
              child: ListView(scrollDirection: Axis.horizontal, children: [
                for (var element in elevations) ...[
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      border: const Border(bottom: BorderSide(width: 2)),
                    ),
                    width: element.height,
                  ),
                  Container(width: 2, color: Colors.black),
                ]
              ]),
            ),
          ),

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
    // final elevationCards = context.space
    //     .toJson()
    //     .entries
    //     .map((item) => ElevationInfo(
    //         height: item.value as double, key: item.key.toString()))
    //     .toList()
    //     .map((elevationInfo) => ElevationCard(info: elevationInfo))
    //     .toList();

    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverLayoutBuilder(builder: (context, constraints) {
        // return SliverList.list(children: elevationCards);
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
    // const BorderRadius borderRadius = BorderRadius.all(Radius.circular(4.0));

    final size = Size(widget.info.height, 16);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Expanded(child: Text(widget.info.key.toString())),
        Expanded(child: Text(widget.info.height.toString())),
        const SizedBox(width: 36),
        Expanded(
          flex: 15,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              constraints: BoxConstraints.tight(size),
              color: Theme.of(context).colorScheme.secondaryContainer,
              // color: Colors.purple.shade300,
            ),
          ]),
        ),
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

final List<ElevationInfo> elevations = Space.standard()
    .toJson()
    .entries
    .map((item) => ElevationInfo(height: item.value, key: item.key.toString()))
    .toList();
