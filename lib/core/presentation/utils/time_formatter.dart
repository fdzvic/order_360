import 'package:flutter/services.dart';

class TimeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Solo se aplica el formateo cuando el texto cambia y no está vacío
    if (newValue.text.isNotEmpty && newValue.text != oldValue.text) {
      String formattedText = _formatTime(newValue.text);
      return newValue.copyWith(
        text: formattedText,
        selection: _updateCursorPosition(formattedText, newValue),
      );
    }

    return newValue;
  }

  String _formatTime(String text) {
    // Elimina todos los caracteres no numéricos
    String cleanText = text.replaceAll(RegExp(r'[^0-9]'), '');

    // Agrega los caracteres ':' en las posiciones adecuadas
    if (cleanText.length > 6) {
      cleanText = cleanText.substring(0, 6);
    }
    if (cleanText.length > 4) {
      cleanText = cleanText.replaceRange(4, 4, ':');
    }
    if (cleanText.length > 2) {
      cleanText = cleanText.replaceRange(2, 2, ':');
    }

    return cleanText;
  }

  TextSelection _updateCursorPosition(
      String formattedText, TextEditingValue newValue) {
    // Calcula la nueva posición del cursor después del formateo
    int cursorIndex = newValue.selection.end;
    int cursorOffset = formattedText.length - newValue.text.length;
    return TextSelection.collapsed(offset: cursorIndex + cursorOffset);
  }
}

class AxisNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final cleanText = newValue.text.replaceAll(RegExp(r'[^0-9.,]'), '');

    if (cleanText.length > 5) {
      return oldValue;
    }

    return TextEditingValue(
      text: cleanText,
      selection: TextSelection.collapsed(offset: cleanText.length),
    );
  }
}
