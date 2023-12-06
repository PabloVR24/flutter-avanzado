import 'package:bandnamesapp/infrastructure/models/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () => context.push('/status'), icon: const Icon(Icons.add_circle_outline_sharp))],
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Server Status : ${socketService.serverStataus}')],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.upload_file_outlined),
        onPressed: () {
          socketService.socket.emit('emitir-mensaje', {'mensaje': 'hola desde flutter', 'mensaje2': 0});
        },
      ),
    );
  }
}
