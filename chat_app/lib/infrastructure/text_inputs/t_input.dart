import 'package:formz/formz.dart';

enum TError { empty, format, length }

class TInput extends FormzInput<String, TError> {
  const TInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const TInput.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    return null;
  }

  @override
  TError? validator(String value) {
    return null;
  }
}
