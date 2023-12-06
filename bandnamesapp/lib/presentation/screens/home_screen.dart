import 'package:bandnamesapp/infrastructure/models/band_model.dart';
import 'package:bandnamesapp/infrastructure/models/services/socket_service.dart';
import 'package:bandnamesapp/presentation/blocs/formz_bloc/formz_bloc.dart';
import 'package:bandnamesapp/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('active-bands', (payload) {
      _handleActiveBands(payload);
    });
    super.initState();
  }

  _handleActiveBands(dynamic payload) {
    bands = (payload as List).map((band) => BandModel.fromJson(band)).toList();
    setState(() {});
  }

  List<BandModel> bands = [];
  @override
  Widget build(BuildContext context) {
    final formzBloc = context.read<FormzBloc>();
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists Names'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
                child: socketService.serverStataus == ServerStatus.connecting
                    ? const Icon(Icons.connecting_airports_outlined, color: Colors.amber)
                    : socketService.serverStataus == ServerStatus.online
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : const Icon(Icons.offline_bolt, color: Colors.red)),
          )
        ],
      ),
      body: Column(
        children: [
          _pieChart(),
          Expanded(
            child: ListView.builder(
              itemCount: bands.length,
              itemBuilder: (context, index) {
                final band = bands[index];
                return Dismissible(
                  key: Key(band.id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    socketService.socket.emit('delete-band', {'id': band.id});
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
                      leading: CircleAvatar(child: Text(band.name.substring(0, 2))),
                      title: Text(band.name),
                      trailing: Text('${band.votes}'),
                      onTap: () {
                        socketService.socket.emit('vote-band', {'id': band.id});
                      }),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  void addBandToList() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.emit('add-band', {'name': context.read<FormzBloc>().state.name.value});

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

  Widget _pieChart() {
    Map<String, double> dataMap = {'': 0};
    for (var band in bands) {
      dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
    }
    print(dataMap);
    return SizedBox(
        height: 200,
        child: PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.width / 3.2,

          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 32,
          centerText: "Bands",
          legendOptions: const LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
          // gradientList: ---To add gradient colors---
          // emptyColorGradient: ---Empty Color gradient---
        ));
  }
}
