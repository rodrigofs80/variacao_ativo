import 'package:flutter_test/flutter_test.dart';
import 'package:variacao_ativo/src/util/util.dart';

void main() {

  group('Util Test', () {

    test('Timestamp to date', () {
      final resutl = Util.timestampToDate(1673528580);
      expect(resutl, '12/01 - 10:03');
      },
    );

    test('Format Decimal Double', () {
      final resutl = Util.formatDecimalDouble(16.73228580);
      expect(resutl, '16.73');
      },
    );

    test('Calculate variation up', () {
      final resutl = Util.calculate(16.73228580, 17.73228580);
      expect(resutl, 5.976469754060739);
      },
    );

    test('Calculate variation down', () {
      final resutl = Util.calculate(17.73228580, 16.73228580);
      expect(resutl, -5.976469754060739);
      },
    );

    test('Calculate variation zero', () {
      final resutl = Util.calculate(17.73228580, 17.73228580);
      expect(resutl, 0);
      },
    );
  });
}