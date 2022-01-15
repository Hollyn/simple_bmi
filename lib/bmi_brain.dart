import 'dart:math';

class BmiBrain {
  int height;
  int weight;
  late double _bmi;
  BmiBrain({
    required this.height,
    required this.weight,
  }) {
    _bmi = weight / pow(height / 100, 2);
  }

  String getBmi() {
    return _bmi.toStringAsFixed(1);
  }

  String getTitle() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 15) {
      return 'Normal';
    }
    return "Underweight";
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You must exercise more. You can do it!";
    } else if (_bmi > 15) {
      return 'You have a normal body weight. Good job!';
    }
    return "You should consider eating more. Your health depends on it ;) ";
  }
}
