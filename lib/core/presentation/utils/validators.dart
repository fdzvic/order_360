final RegExp _emailRegExp = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);
String? validateEmail(String email, {String? matchValue}) {
  if (email.isEmpty) {
    return 'Introduce un correo';
  } else if (!_emailRegExp.hasMatch(email.trim())) {
    return 'Por favor introduce un correo válido';
  }

  /// Si es un campo de repetición
  if (matchValue != null) {
    return validateMatchValue(email, matchValue);
  }

  return null;
}

String? validatePassword(String input, {String? matchValue, bool? errorBack}) {
  if (input.isEmpty) {
    return 'La contraseña es obligatoria.';
  }

  if (errorBack!) {
    return 'La contraseña es incorrecta.';
  }

  // if (input.trim().length < 6) {
  //   return 'The password must be at least 6 characters';
  // }

  /// Si es un campo de repetición
  if (matchValue != null) {
    return validateMatchValue(input, matchValue);
  }
  return null;
}

String? validateUser(String input, {bool? errorBack}) {
  if (input.isEmpty) {
    return 'El nombre de usuario es obligatorio.';
  }

  if (errorBack!) {
    return 'El nombre de usuario es incorrecto.';
  }
  // if (matchValue != null) {
  //   return validateMatchValue(input, matchValue);
  // }
  return null;
}

String? validateText(String input, {String? matchValue}) {
  if (input.isEmpty) {
    return 'Este campo es obligatorio';
  } else {
    // String pattern = r'^[a-zA-Z\s]*$';
    // RegExp regExp = RegExp(pattern);
    // if (!regExp.hasMatch(input)) {
    //   return 'Ingresa un nombre válido';
    // }

    /// Si es un campo de repetición
    if (matchValue != null) {
      return validateMatchValue(input, matchValue);
    }
    return null;
  }
}

String? validateName(String? input) {
  if ((input ?? "").isEmpty) {
    return 'Este campo es obligatorio';
  } else {
    String pattern =
        r'^[a-zA-ZÀ-ÿ\u00f1\u00d1]*(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch((input ?? ""))) {
      return 'Ingresa un texto válido';
    }
    return null;
  }
}

String? validatePhone(String input, {String? matchValue}) {
  if (input.isEmpty || input[0] != '3' || input.length < 10) {
    return 'Introduce un número de celular válido';
  }

  /// Si es un campo de repetición
  if (matchValue != null) {
    return validateMatchValue(input, matchValue);
  }
  return null;
}

String? validateDocument(input) {
  if (input.trim() == "") {
    return 'Escribe tu número de cédula';
  }
  if (input.trim().length < 6 || input.trim().length > 20) {
    return 'Debes diligenciar un documento válido';
  }
  return null;
}

String? validateNumber(input) {
  if (input.isEmpty) {
    return 'Este campo es obligatorio';
  }
  if (!RegExp(r"^[0-9.,]*$").hasMatch(input)) {
    return 'Solo puede ingresar números';
  }

  if (input.contains('.') && input.contains(',') ||
      input.split('.').length > 2 ||
      input.split(',').length > 2) {
    return 'Numero incorrecto';
  }
  return null;
}

String? validateTime(String input, String compareTime) {
  if (input.isEmpty) {
    return 'Este campo es obligatorio';
  }

  if (!RegExp(r"^[0-9 :]*$").hasMatch(input)) {
    return 'Solo puede ingresar números';
  }

  List<String> timeComponents = input.split(':');
  List<String> timeComponentCompare = compareTime.split(':');
  if (timeComponents.length >= 2) {
    int hour = int.tryParse(timeComponents[0]) ?? 0;
    int minutes = int.tryParse(timeComponents[1]) ?? 0;
    int seconds = int.tryParse(timeComponents[2]) ?? 0;

    int hourCompare = int.tryParse(timeComponentCompare[0]) ?? 0;
    int minutesCompare = int.tryParse(timeComponentCompare[1]) ?? 0;
    int secondsCompare = int.tryParse(timeComponentCompare[2]) ?? 0;

    Duration time = Duration(hours: hour, minutes: minutes, seconds: seconds);

    Duration tiempo = Duration(
        hours: hourCompare, minutes: minutesCompare, seconds: secondsCompare);

    if (minutes > 59 || seconds > 59 || time > tiempo) {
      return 'Ingrese un lapso válido de tiempo.';
    }
  }

  return null;
}

String? validateMatchValue(String value, String match) =>
    value != match ? 'Los valores no coinciden' : null;

String? noValidate() => null;
