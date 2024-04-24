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

class Space {
  Space() {
    Map<double, double> temp = {};

    for (var key in _keys) {
      temp.putIfAbsent(key, () => key * 4.0);
    }

    space = Map<double, double>.from(temp);
  }

  late final Map<double, double> space;

  double get $0 => space[0.0]!;
  double get $0p5 => space[0.5]!;
  double get $1 => space[1.0]!;
  double get $2 => space[2.0]!;
  double get $3 => space[3.0]!;
  double get $4 => space[4.0]!;
  double get $5 => space[5.0]!;
  double get $6 => space[6.0]!;
  double get $7 => space[7.0]!;
  double get $8 => space[8.0]!;
  double get $9 => space[9.0]!;
  double get $10 => space[10.0]!;
  double get $11 => space[11.0]!;
  double get $12 => space[12.0]!;
  double get $13 => space[13.0]!;
  // double get $14 => space[14.0]!;
}

// = {
//   0.0: 1.0,
//   0.5: 1.0,
//   1.0: 1.0,
//   2.0: 1.0,
//   3.0: 1.0,
// };


// abstract class Space {
//   static const double $0 = 0.0;
//   static const double $0p5 = 20.0;
//   static const double $1 = 20.0;
//   static const double $2 = 20.0;
//   static const double $3 = 20.0;
//   static const double $4 = 20.0;
//   static const double $5 = 20.0;
//   static const double $6 = 20.0;
//   static const double $7 = 20.0;
//   static const double $8 = 20.0;
//   static const double $9 = 20.0;
//   static const double $10 = 20.0;
//   static const double $11 = 20.0;
//   static const double $12 = 20.0;
//   static const double $13 = 20.0;
//   static const double $14 = 20.0;
//   static const double $15 = 20.0;
//   static const double $16 = 20.0;
// }
