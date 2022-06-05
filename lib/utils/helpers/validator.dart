class Validator {

  Validator._();

  static String? validateHolderName(String? value) {  
    return value == null || value.isEmpty ? "Please enter holder's name and surname!" :
      value.split(" ").length < 2 ? "Please enter both name and surname!" : null;
  }  

  static String? validateCardNumber(String? value) {
    return value == null || value.isEmpty ? "Please enter card number!" : null;
  }

  static String? validateExpryDate(String? value) {
    DateTime curDate = DateTime.now();
    int? cardMonth;
    int? cardYear;

    List<String>? valueList = value?.split("/"); 
    if (valueList != null && valueList.length == 2) {
      cardMonth = int.parse(valueList[0]);
      cardYear = 2000 + int.parse(valueList[1]);
    }  
       
    return value == null || value.length != 5  ? "Please enter expry date!" :
      cardMonth != null && cardYear != null && (cardYear < curDate.year || 
        (cardYear == curDate.year && cardMonth <= curDate.month))  ? "Please enter card with valid expry date!" :  null;
  } 

  static String? validateCVV(String? value) {
    return value == null || value.length != 3 ? "Please enter CVV!" : null;
  }
  
}