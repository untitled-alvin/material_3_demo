// ignore_for_file: annotate_overrides, public_member_api_docs
part of 'theme.dart';

@TailorMixin(themeGetter: ThemeGetter.onThemeData)
class TokenRadius extends ThemeExtension<TokenRadius>
    with _$TokenRadiusTailorMixin {
  const TokenRadius({
    required this.s0,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.s5,
    required this.s6,
    required this.s7,
    required this.s8,
    required this.s9,
    required this.s10,
    required this.s11,
    required this.s12,
  });

  factory TokenRadius.standard() {
    final keys = [
      0.0,
      1.0,
      2.0,
      3.0,
      4.0,
      5.0,
      6.0,
      7.0,
      8.0,
      9.0,
      10.0,
      11.0,
      12.0,
    ];

    final sizes = <double, double>{};

    for (final key in keys) {
      sizes.putIfAbsent(key, () => key * 4.0);
    }

    return TokenRadius(
      s0: sizes[0.0]!,
      s1: sizes[1.0]!,
      s2: sizes[2.0]!,
      s3: sizes[3.0]!,
      s4: sizes[4.0]!,
      s5: sizes[5.0]!,
      s6: sizes[6.0]!,
      s7: sizes[7.0]!,
      s8: sizes[8.0]!,
      s9: sizes[9.0]!,
      s10: sizes[10.0]!,
      s11: sizes[11.0]!,
      s12: sizes[12.0]!,
    );
  }

  final double s0;
  final double s1;
  final double s2;
  final double s3;
  final double s4;
  final double s5;
  final double s6;
  final double s7;
  final double s8;
  final double s9;
  final double s10;
  final double s11;
  final double s12;
}
