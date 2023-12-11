import 'package:formz/formz.dart';

// Define input validation errors
enum DateError { empty, format, length }

// Extend FormzInput and provide the input type and error type.
class DateInput extends FormzInput<String, DateError> {
  // Call super.pure to represent an unmodified form input.
  const DateInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const DateInput.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == DateError.empty) return 'El campo es requerido';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  DateError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return DateError.empty;
    return null;
  }
}