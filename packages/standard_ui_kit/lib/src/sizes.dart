// ignore_for_file: annotate_overrides, public_member_api_docs
part of 'theme.dart';

@TailorMixin()
class Sizes extends ThemeExtension<Sizes> with _$SizesTailorMixin {
  const Sizes({
    required this.s0,
    required this.s0p5,
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
    // required this.s11,
    required this.s12,
    // required this.s13,
    required this.s16,
    required this.s20,
    required this.s24,
    required this.s32,
    required this.s40,
    required this.s48,
    required this.s56,
    required this.s64,
    required this.s72,
    required this.s80,
    required this.s96,
  });

  factory Sizes.standard() {
    final keys = [
      0.0,
      0.5,
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
      12.0,
      16.0,
      20.0,
      24.0,
      32.0,
      40.0,
      48.0,
      56.0,
      64.0,
      72.0,
      80.0,
      96.0,
    ];

    final sizes = <double, double>{};

    for (final key in keys) {
      sizes.putIfAbsent(key, () => key * 4.0);
    }

    return Sizes(
      s0: sizes[0.0]!,
      s0p5: sizes[0.5]!,
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
      s12: sizes[12.0]!,
      s16: sizes[16.0]!,
      s20: sizes[20.0]!,
      s24: sizes[24.0]!,
      s32: sizes[32.0]!,
      s40: sizes[40.0]!,
      s48: sizes[48.0]!,
      s56: sizes[56.0]!,
      s64: sizes[64.0]!,
      s72: sizes[72.0]!,
      s80: sizes[80.0]!,
      s96: sizes[96.0]!,
    );
  }

  final double s0;
  final double s0p5;
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
  final double s12;
  final double s16;
  final double s20;
  final double s24;
  final double s32;
  final double s40;
  final double s48;
  final double s56;
  final double s64;
  final double s72;
  final double s80;
  final double s96;

  Map<String, double> toJson() {
    return <String, double>{
      's0': s0,
      's0p5': s0p5,
      's1': s1,
      's2': s2,
      's3': s3,
      's4': s4,
      's5': s5,
      's6': s6,
      's7': s7,
      's8': s8,
      's9': s9,
      's10': s10,
      's12': s12,
      's16': s16,
      's20': s20,
      's24': s24,
      's32': s32,
      's40': s40,
      's48': s48,
      's56': s56,
      's64': s64,
      's72': s72,
      's80': s80,
      's96': s96,
    };
  }
}
