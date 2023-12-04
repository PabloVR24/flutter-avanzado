import 'package:bandnamesapp/infrastructure/models/band_model.dart';
import 'package:bandnamesapp/presentation/blocs/bloc/formz_bloc.dart';
import 'package:bandnamesapp/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final formzBloc = context.read<FormzBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists Names'),
      ),
      body: ListView.builder(
        itemCount: formzBloc.state.bands.length,
        itemBuilder: (context, index) {
          final band = formzBloc.state.bands[index];
          return Dismissible(
            key: Key(band.id),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              print('direcction: $direction');
            },
            background: Container(
              padding: const EdgeInsets.only(left: 10),
              color: Colors.red,
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  )),
            ),
            child: ListTile(
                leading: CircleAvatar(child: Text(band.name.substring(0, 2))), title: Text(band.name), trailing: Text('${band.votes}'), onTap: () {}),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  void addBandToList() {
    context
        .read<FormzBloc>()
        .add(AddBandToList(BandModel(id: DateTime.now().toString(), name: context.read<FormzBloc>().state.name.value, votes: 0)));
    setState(() {});
    context.pop();
  }

  void addNewBand() {
    showDialog(
        context: context,
        builder: (context) {
          final state = context.read<FormzBloc>();
          return AlertDialog(
            title: const Text('Nueva banda a agregar.'),
            content: CustomTextFormField(
                onChanged: (value) => state.add(NameChanged(value)),
                errorMessage: state.state.name.errorMessage,
                label: 'Nombre de la banda',
                hint: 'Nombre'),
            actions: [
              TextButton(
                  onPressed: () => context.pop(),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.red),
                  )),
              FilledButton(onPressed: addBandToList, child: const Text('Agregar')),
            ],
          );
        });
  }
}
