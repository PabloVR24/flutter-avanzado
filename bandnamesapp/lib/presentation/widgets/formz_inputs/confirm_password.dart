
import 'package:formz/formz.dart';

// Define input validation errors
enum ConfirmPasswordError { empty, noCoincidence }

// Extend FormzInput and provide the input type and error type.
class ConfirmPassword extends FormzInput<String, ConfirmPasswordError> {
  // Call super.pure to represent an unmodified form input.
  const ConfirmPassword.pure({this.original = ''}) : super.pure('');

  final String original;

  // Call super.dirty to represent a modified form input.
  const ConfirmPassword.dirty({required this.original, String value = ''})
      : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == ConfirmPasswordError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == ConfirmPasswordError.noCoincidence) {
      return 'La contraseña no coincide';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  ConfirmPasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return ConfirmPasswordError.empty;
    }
    if (value != original) return ConfirmPasswordError.noCoincidence;

    return null;
  }
}
