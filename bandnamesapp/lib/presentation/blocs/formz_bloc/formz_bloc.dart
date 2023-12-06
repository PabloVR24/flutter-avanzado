import 'dart:async';

import 'package:bandnamesapp/infrastructure/models/band_model.dart';
import 'package:bandnamesapp/presentation/widgets/formz_inputs/jobs/name_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'formz_event.dart';
part 'formz_state.dart';

class FormzBloc extends Bloc<FormzEvent, FormzState> {
  FormzBloc() : super(const FormzState()) {
    on<NameChanged>(_nameChanged);
    on<AddBandToList>(_addBandToList);
  }

  FutureOr<void> _nameChanged(NameChanged event, Emitter<FormzState> emit) {
    final name = NameInput.dirty(event.name);
    emit(state.copyWith(name: name));
  }

  FutureOr<void> _addBandToList(AddBandToList event, Emitter<FormzState> emit) {
    final appendBands = [...state.bands, event.band];

    emit(state.copyWith(bands: appendBands));
    print(state.bands);
  }
}
