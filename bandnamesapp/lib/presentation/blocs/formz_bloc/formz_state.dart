// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'formz_bloc.dart';

class FormzState extends Equatable {
  final NameInput name;
  final List<BandModel> bands;

  const FormzState({
    this.name = const NameInput.pure(),
    this.bands = const [],
  });

  @override
  List<Object> get props => [name, bands];

  FormzState copyWith({
    NameInput? name,
    List<BandModel>? bands,
  }) {
    return FormzState(
      name: name ?? this.name,
      bands: bands ?? this.bands,
    );
  }
}
