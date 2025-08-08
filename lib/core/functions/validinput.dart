import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "date") {
    if (!GetUtils.isDateTime(val)) {
      return "not valid date";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}

isPasswordCompliant(String password, [int minLength = 8]) {
  if (password.isEmpty) {
    return "can't be Empty";
  } else if (password.length < minLength) {
    return "can't be less than $minLength";
  } else {
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return "must contain at least one uppercase letter";
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return "must contain at least one number";
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return "must contain at least one lowercase letter";
    }
  }
}

validInputIsEmpty(String val) {


  if (val.isEmpty) {
    return "can't be Empty";
  }

}
