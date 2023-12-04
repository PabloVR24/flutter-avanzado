import 'package:formz/formz.dart';

// Define input validation errors
enum NameInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class NameInput extends FormzInput<String, NameInputError> {
  // Call super.pure to represent an unmodified form input.
  const NameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const NameInput.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NameInputError.empty) return 'El campo es requerido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NameInputError.empty;

    return null;
  }
}
