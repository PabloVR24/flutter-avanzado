import 'package:formz/formz.dart';

// Define input validation errors
enum BirthLocationError { empty, selectCity }

// Extend FormzInput and provide the input type and error type.
class BirthLocation extends FormzInput<String, BirthLocationError> {
  // Call super.pure to represent an unmodified form input.
  const BirthLocation.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const BirthLocation.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == BirthLocationError.empty) {
      return 'El campo es requerido';
    }

    if (displayError == BirthLocationError.selectCity) {
      return 'Completa el campo seleccionando la ciudad';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  BirthLocationError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return BirthLocationError.empty;
    if (value == 'Coahuila' && !value.contains(',')) {
      return BirthLocationError.selectCity;
    }
    return null;
  }
}
