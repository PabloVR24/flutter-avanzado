import 'package:formz/formz.dart';

// Define input validation errors
enum WebError { empty, length, format, equals }

class Website extends FormzInput<String, WebError> {
  static final RegExp webRegExp =
      RegExp(r'^([a-z0-9_-]+\.){0,3}[a-z]{2,15}(\.[a-z]{2,6})$');

  const Website.pure() : super.pure('');

  const Website.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == WebError.empty) return 'El campo es requerido';
    if (displayError == WebError.length) return 'Mínimo 6 caracteres';
    if (displayError == WebError.format) {
      return 'Sitio Web Invalido';
    }

    return null;
  }

  @override
  WebError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return WebError.empty;
    if (value.length < 6) return WebError.length;
    if (!webRegExp.hasMatch(value)) return WebError.format;

    return null;
  }
}
