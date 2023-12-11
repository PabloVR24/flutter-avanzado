part of 'formz_bloc.dart';

class FormzState {
  const FormzState({
    this.verifyPassword = const Password.pure(),
    this.name = const Name.pure(),
    this.phone = const Phone.pure(),
    this.email = const Email.pure(),
    this.userName = const UserName.pure(),
    this.password = const Password.pure(),
    this.date = const DateInput.pure(),
    this.isFormValid = false,
    this.website = const Website.pure(),
    this.imageURL = 'not-selected',
    this.coverImageURL = 'not-selected',
  });

  final String imageURL;
  final String coverImageURL;
  final Email email;
  final Password password;
  final Password verifyPassword;
  final Phone phone;
  final Name name;
  final Website website;
  final bool isFormValid;
  final DateInput date;
  final UserName userName;

  FormzState copyWith({
    Email? email,
    Password? password,
    Phone? phone,
    UserName? userName,
    Website? website,
    String? imageURL,
    String? coverImageURL,
    Password? verifyPassword,
    Name? name,
    DateInput? date,
    bool? isFormValid,
  }) {
    return FormzState(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        verifyPassword: verifyPassword ?? this.verifyPassword,
        phone: phone ?? this.phone,
        userName: userName ?? this.userName,
        date: date ?? this.date,
        website: website ?? this.website,
        isFormValid: isFormValid ?? this.isFormValid,
        imageURL: imageURL ?? this.imageURL,
        coverImageURL: coverImageURL ?? this.coverImageURL);
  }
}
