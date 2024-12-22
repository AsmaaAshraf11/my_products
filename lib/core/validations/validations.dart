// name
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'not_null_name';
  }
  if (value.length < 4) {
    return 'length_name';
  }
  return null;
}

// email
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'not_null_email';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'invalid_mail';
  }
  return null;
}

// phone
String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'not_null_phone';
  }
  if (value.length < 6) {
    return 'length_phone';
  }
  return null;
}

// password
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'not_null_password';
  }
  if (value.length < 6) {
    return 'length_password';
  }
  return null;
}

// message
String? validateMessage(String? value) {
  if (value == null || value.isEmpty) {
    return 'not_null_message';
  }
  if (value.length < 10) {
    return 'length_message';
  }
  return null;
}

// positive
String? validatePositiveNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'not_null_num';
  }
  final number = double.tryParse(value);
  if (number == null) {
    return 'valid_num';
  }
  if (number < 0) {
    return 'positive_num';
  }
  return null;
}

// positive
String? validatePositiveIntNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'not_null_num';
  }
  final number = int.tryParse(value);
  if (number == null) {
    return 'valid_num';
  }
  if (number < 0) {
    return 'positive_num';
  }
  return null;
}
