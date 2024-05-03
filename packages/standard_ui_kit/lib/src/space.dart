// ignore_for_file: annotate_overrides, public_member_api_docs
part of 'theme.dart';

@TailorMixin(themeGetter: ThemeGetter.onThemeData)
class Space extends ThemeExtension<Space> with _$SpaceTailorMixin {
  const Space({
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
    required this.s11,
    required this.s12,
    required this.s13,
    required this.s14,
    required this.s15,
    required this.s16,
    required this.s17,
    required this.s18,
    required this.s19,
    required this.s20,
  });

  factory Space.standard() {
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
      11.0,
      12.0,
      13.0,
      14.0,
      15.0,
      16.0,
      17.0,
      18.0,
      19.0,
      20.0,
    ];

    final space = <double, double>{};

    for (final key in keys) {
      space.putIfAbsent(key, () => key * 4.0);
    }

    return Space(
      s0: space[0.0]!,
      s0p5: space[0.5]!,
      s1: space[1.0]!,
      s2: space[2.0]!,
      s3: space[3.0]!,
      s4: space[4.0]!,
      s5: space[5.0]!,
      s6: space[6.0]!,
      s7: space[7.0]!,
      s8: space[8.0]!,
      s9: space[9.0]!,
      s10: space[10.0]!,
      s11: space[11.0]!,
      s12: space[12.0]!,
      s13: space[13.0]!,
      s14: space[14.0]!,
      s15: space[15.0]!,
      s16: space[16.0]!,
      s17: space[17.0]!,
      s18: space[18.0]!,
      s19: space[19.0]!,
      s20: space[20.0]!,
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
  final double s11;
  final double s12;
  final double s13;
  final double s14;
  final double s15;
  final double s16;
  final double s17;
  final double s18;
  final double s19;
  final double s20;

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
      's11': s11,
      's12': s12,
      's13': s13,
      's14': s14,
      's15': s15,
      's16': s16,
      's17': s17,
      's18': s18,
      's19': s19,
      's20': s20,
    };
  }
}
