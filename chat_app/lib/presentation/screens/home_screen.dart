import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () => context.push('/login'), icon: const Icon(Icons.abc))],
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
