// ignore_for_file: constant_identifier_names, public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// {@template bulk_icons}
/// Bulk Icons Flutter package
/// {@endtemplate}
enum BulkIcons {
  bag_timer(
    'bag_timer',
    '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M11.129 15.879c-.25 0-.5-.13-.64-.36-.21-.35-.1-.82.26-1.03l.89-.53v-1.08c0-.41.34-.75.75-.75s.75.34.75.75v1.5c0 .26-.14.51-.36.64l-1.25.75c-.14.07-.27.11-.4.11Z" fill="#FF8A65"></path><path opacity=".4" d="m21.848 11.41-.62 6.78c-.21 2-1.03 4.04-5.43 4.04h-7.62c-4.4 0-5.22-2.04-5.42-4.03l-.61-6.51c.01.01.02.02.04.03.34.22.67.44 1.03.64.14.09.29.17.44.25 1.13.62 2.34 1.11 3.59 1.45.5.15 1.01.26 1.53.35a3.25 3.25 0 0 0 3.22 2.84c1.67 0 3.05-1.27 3.23-2.9v-.01c.51-.1 1.02-.23 1.52-.38 1.25-.39 2.46-.91 3.59-1.57.06-.03.11-.06.15-.09.46-.25.9-.54 1.32-.84.02-.01.03-.03.04-.05Z" fill="#FF8A65"></path><path d="M21.091 6.98c-.85-.94-2.26-1.41-4.33-1.41h-.24v-.04c0-1.68 0-3.76-3.76-3.76h-1.52c-3.76 0-3.76 2.08-3.76 3.76v.04h-.24c-2.07 0-3.49.47-4.33 1.41-.99 1.11-.96 2.58-.86 3.59l.01.07.09 1.05c.01.01.03.02.05.03.34.22.67.44 1.03.64.14.09.29.17.44.25 1.13.62 2.34 1.11 3.58 1.45a4.755 4.755 0 0 0 4.75 4.69c2.62 0 4.75-2.13 4.75-4.75v-.04c1.26-.38 2.47-.91 3.6-1.57.06-.03.1-.06.15-.09.46-.25.9-.54 1.32-.84.01-.01.03-.03.04-.05l.04-.36.05-.47c.01-.06.01-.11.02-.18.08-1 .06-2.38-.88-3.42ZM8.911 5.53c0-1.7 0-2.34 2.33-2.34h1.52c2.33 0 2.33.64 2.33 2.34v.04h-6.18v-.04Zm3.09 11.72a3.25 3.25 0 0 1-3.22-2.84c-.02-.13-.03-.27-.03-.41 0-1.79 1.46-3.25 3.25-3.25s3.25 1.46 3.25 3.25c0 .12-.01.23-.02.34v.01a3.258 3.258 0 0 1-3.23 2.9Z" fill="#FF8A65"></path></svg>''',
  ),
  diamonds(
    'diamonds',
    '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="m21.21 13.24-6.85 7.54c-1.3 1.43-3.42 1.43-4.72 0l-6.85-7.54c-.77-.85-1.02-2.39-.56-3.44l.8-1.8h17.94l.8 1.8c.46 1.05.21 2.59-.56 3.44Z" fill="#FF8A65"></path><path opacity=".4" d="M20.97 7.998H3.03l1.76-3.96c.47-1.04 1.21-1.89 2.91-1.89h8.6c1.7 0 2.44.85 2.91 1.89l1.76 3.96Z" fill="#FF8A65"></path></svg>''',
  );

  /// {@macro bulk_icons}
  const BulkIcons(this.label, this.data);
  final String label;
  final String data;
}

class BulkIcon extends StatelessWidget {
  const BulkIcon(
    this.icon, {
    super.key,
    this.matchTextDirection = false,
    this.size,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.allowDrawingOutsideViewBox = false,
    this.placeholderBuilder,
    this.color,
    this.colorBlendMode = BlendMode.srcIn,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.clipBehavior = Clip.hardEdge,
    this.cacheColorFilter = false,
    this.theme,
  });

  final BulkIcons icon;
  final bool matchTextDirection;
  final double? size;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final bool allowDrawingOutsideViewBox;
  final WidgetBuilder? placeholderBuilder;
  final Color? color;
  final BlendMode colorBlendMode;
  final String? semanticsLabel;
  final bool excludeFromSemantics;
  final Clip clipBehavior;
  final bool cacheColorFilter;
  final SvgTheme? theme;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      icon.data,
      key: key,
      matchTextDirection: matchTextDirection,
      width: size ?? IconTheme.of(context).size,
      height: size ?? IconTheme.of(context).size,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      // ignore: deprecated_member_use
      color: color ?? IconTheme.of(context).color,
      // ignore: deprecated_member_use
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      // ignore: deprecated_member_use
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }
}
