import 'package:intl/intl.dart';

class Util {

  static String timestampToDate(int timestamp){
    return DateFormat('dd/MM - hh:mm').format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }

  static String formatDecimalDouble(double number){
    return  number.toStringAsFixed(2);
  }

  static calculate(double n1, double n2){
    switch(n1.compareTo(n2)){
      case 1: return _percentDown(n1, n2);
      case -1: return _percentUp(n1, n2);
      case 0: return 0;
    }
  }

  static double _percentUp(double n1, double n2){
    return (n2 - n1)/n1 * 100;
  }

  static double _percentDown(double n1, double n2){
    return (n2 - n1)/n2 * 100;
  }
}