// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'formz_bloc.dart';

class FormzState extends Equatable {
  final NameInput name;
  final List<BandModel> bands;

  const FormzState({
    this.name = const NameInput.pure(),
    this.bands = const [
      BandModel(id: '1', name: 'Post Malone', votes: 13),
      BandModel(id: '2', name: 'Bad Bunny', votes: 13),
      BandModel(id: '3', name: 'Hardwell', votes: 43),
      BandModel(id: '4', name: 'Peso Pluma', votes: 12),
    ],
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
