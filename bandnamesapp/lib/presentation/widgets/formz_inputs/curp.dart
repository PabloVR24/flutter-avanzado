import 'package:formz/formz.dart';

// Define input validation errors
enum CurpError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Curp extends FormzInput<String, CurpError> {
  static final RegExp emailRegExp = RegExp(
    r'^[\A-Z]{4}[0-9]{6}[HM]{1}[A-Z]{2}[BCDFGHJKLMNPQRSTVWXYZ]{3}([A-Z]{2})?([0-9]{2})$',
  );

  // Call super.pure to represent an unmodified form input.
  const Curp.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Curp.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == CurpError.empty) return 'El campo es requerido';
    if (displayError == CurpError.format) return 'El formato es incorrecto';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  CurpError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return CurpError.empty;
    if (!emailRegExp.hasMatch(value)) return CurpError.format;

    return null;
  }
}
