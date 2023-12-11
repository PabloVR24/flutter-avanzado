import 'package:chat_app/infrastructure/text_inputs/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'formz_event.dart';
part 'formz_state.dart';

class FormzBloc extends Bloc<FormzEvent, FormzState> {
  bool isValid;
  FormzBloc({this.isValid = false}) : super(const FormzState()) {
    on<EmailChanged>((event, emit) {
      final email = Email.dirty(event.email);

      emit(state.copyWith(email: email));
    });

    on<PasswordChanged>((event, emit) {
      final password = Password.dirty(event.password);

      emit(state.copyWith(password: password));
    });

    on<VerifyPasswordChanged>((event, emit) {
      final verifyPassword = Password.dirty(event.password);
      emit(state.copyWith(verifyPassword: verifyPassword));
    });

    on<NameChanged>((event, emit) {
      final name = Name.dirty(event.name);
      emit(state.copyWith(name: name));
    });

    on<PhoneChanged>((event, emit) {
      final phone = Phone.dirty(event.phone);
      emit(state.copyWith(phone: phone));
    });

    on<DateChanged>((event, emit) {
      final date = DateInput.dirty(event.date);
      emit(state.copyWith(date: date));
    });

    on<UserNameChanged>((event, emit) {
      final username = UserName.dirty(event.username);
      emit(state.copyWith(userName: username));
    });

    on<WebSiteChanged>((event, emit) {
      final website = Website.dirty(event.website);
      emit(state.copyWith(website: website));
    });
  }
}
