part of 'formz_bloc.dart';

abstract class FormzEvent extends Equatable {
  const FormzEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends FormzEvent {
  const EmailChanged(this.email);
  final String email;
  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends FormzEvent {
  const PasswordChanged(this.password);
  final String password;
  @override
  List<Object?> get props => [password];
}

class VerifyPasswordChanged extends FormzEvent {
  const VerifyPasswordChanged(this.password);
  final String password;
  @override
  List<Object?> get props => [password];
}

class NameChanged extends FormzEvent {
  const NameChanged(this.name);
  final String name;
  @override
  List<Object?> get props => [name];
}

class PhoneChanged extends FormzEvent {
  const PhoneChanged(this.phone);
  final String phone;
  @override
  List<Object?> get props => [phone];
}

class DateChanged extends FormzEvent {
  const DateChanged(this.date);
  final String date;
  @override
  List<Object?> get props => [date];
}

class UserNameChanged extends FormzEvent {
  const UserNameChanged(this.username);
  final String username;
  @override
  List<Object?> get props => [username];
}

class WebSiteChanged extends FormzEvent {
  const WebSiteChanged(this.website);
  final String website;
  @override
  List<Object?> get props => [website];
}

class DescriptionChanged extends FormzEvent {
  const DescriptionChanged(this.desc);
  final String desc;
  @override
  List<Object?> get props => [desc];
}

class LocationChanged extends FormzEvent {
  const LocationChanged(this.location);
  final String location;
  @override
  List<Object?> get props => [location];
}

class ImageChanged extends FormzEvent {
  final String imageURL;

  const ImageChanged(this.imageURL);
  @override
  List<Object?> get props => [imageURL];
}

class CoverImageChanged extends FormzEvent {
  final String coverImageURL;

  const CoverImageChanged(this.coverImageURL);
  @override
  List<Object?> get props => [coverImageURL];
}