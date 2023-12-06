part of 'formz_bloc.dart';

class FormzEvent extends Equatable {
  const FormzEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends FormzEvent {
  final String name;

  const NameChanged(this.name);
}

class AddBandToList extends FormzEvent {
  final BandModel band;
  const AddBandToList(this.band);
}
