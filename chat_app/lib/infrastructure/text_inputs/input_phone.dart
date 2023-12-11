import 'package:formz/formz.dart';

// Define input validation errors
enum PhoneError { empty, length, format, equals }

// Extend FormzInput and provide the input type and error type.
class Phone extends FormzInput<String, PhoneError> {
  static final RegExp passwordRegExp = RegExp(
    r'^\d{10}$',
  );

  // Call super.pure to represent an unmodified form input.
  const Phone.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Phone.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PhoneError.empty) return 'El campo telefono es requerido';
    if (displayError == PhoneError.length) return 'Mínimo 10 digitos';
    if (displayError == PhoneError.format) {
      return 'Telefono Invalido';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PhoneError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PhoneError.empty;
    if (value.length < 10) return PhoneError.length;
    if (!passwordRegExp.hasMatch(value)) return PhoneError.format;

    return null;
  }
}