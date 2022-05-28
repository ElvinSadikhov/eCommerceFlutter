import 'package:e_commerce_app/data/strings.dart';

class TotalPrice { 
  static String getTotal(String pr1, String pr2) {
    return "${Strings.euro} ${double.parse(pr1.substring(2)) + double.parse(pr2.substring(2))}";
  }
}