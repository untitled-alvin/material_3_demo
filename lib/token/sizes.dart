final _keys = [
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
  13.0
];

class Sizes {
  Sizes._() {
    Map<double, double> temp = {};

    for (var key in _keys) {
      temp.putIfAbsent(key, () => key * 4.0);
    }

    sizes = Map<double, double>.from(temp);
  }

  late final Map<double, double> sizes;

  double get $0 => sizes[0.0]!;
  double get $0p5 => sizes[0.5]!;
  double get $1 => sizes[1.0]!;
  double get $2 => sizes[2.0]!;
  double get $3 => sizes[3.0]!;
  double get $4 => sizes[4.0]!;
  double get $5 => sizes[5.0]!;
  double get $6 => sizes[6.0]!;
  double get $7 => sizes[7.0]!;
  double get $8 => sizes[8.0]!;
  double get $9 => sizes[9.0]!;
  double get $10 => sizes[10.0]!;
  double get $11 => sizes[11.0]!;
  double get $12 => sizes[12.0]!;
  double get $13 => sizes[13.0]!;
  // double get $14 => space[14.0]!;
}
