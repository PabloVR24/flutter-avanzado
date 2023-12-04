import 'package:formz/formz.dart';

// Define input validation errors
enum UserLocationError { empty, selectCity }

// Extend FormzInput and provide the input type and error type.
class UserLocation extends FormzInput<String, UserLocationError> {
  // Call super.pure to represent an unmodified form input.
  const UserLocation.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserLocation.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UserLocationError.empty) return 'El campo es requerido';
    if (displayError == UserLocationError.selectCity) {
      return 'Completa el campo seleccionando la ciudad';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  UserLocationError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UserLocationError.empty;
    if (value == 'Coahuila' && !value.contains(',')) {
      return UserLocationError.selectCity;
    }

    return null;
  }
}
