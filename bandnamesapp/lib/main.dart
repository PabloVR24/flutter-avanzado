import 'package:bandnamesapp/infrastructure/models/services/socket_service.dart';
import 'package:bandnamesapp/presentation/blocs/formz_bloc/formz_bloc.dart';
import 'package:bandnamesapp/presentation/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SocketService(),
        )
      ],
      child: BlocProvider(
        create: (context) => FormzBloc(),
        child: MaterialApp.router(
          theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter().getRouter(),
        ),
      ),
    );
  }
}
