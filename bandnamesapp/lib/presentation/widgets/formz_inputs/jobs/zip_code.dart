import 'package:formz/formz.dart';

// Define input validation errors
enum ZipCodeError { empty, length }

// Extend FormzInput and provide the input type and error type.
class ZipCode extends FormzInput<String, ZipCodeError> {
  // Call super.pure to represent an unmodified form input.
  const ZipCode.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const ZipCode.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == ZipCodeError.empty) return 'El campo es requerido';
    if (displayError == ZipCodeError.length) return 'Codigo postal no valido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  ZipCodeError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return ZipCodeError.empty;
    if (value.length != 5) return ZipCodeError.length;

    return null;
  }
}
