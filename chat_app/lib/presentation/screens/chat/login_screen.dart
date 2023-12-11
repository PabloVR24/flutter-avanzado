import 'package:chat_app/presentation/screens/bloc/formz_bloc/formz_bloc.dart';
import 'package:chat_app/presentation/widgets/buttons/custom_button.dart';
import 'package:chat_app/presentation/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => FormzBloc(),
      child: BlocBuilder<FormzBloc, FormzState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ChatApp',
                      style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            insideIcon: const Icon(Icons.mail),
                            label: 'Correo',
                            hint: 'something@mail.com',
                            onChanged: (value) => context.read<FormzBloc>().add(EmailChanged(value)),
                            errorMessage: state.email.errorMessage,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            insideIcon: const Icon(Icons.lock),
                            label: 'Contraseña',
                            hint: '***********',
                            onChanged: (value) => context.read<FormzBloc>().add(PasswordChanged(value)),
                            errorMessage: state.password.errorMessage,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onPressed: state.password.isValid && state.email.isValid
                                ? () {
                                    print(state.email.value);
                                    print(state.password.value);
                                  }
                                : null,
                            text: 'Ingresar',
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            '¿No tienes una cuenta?',
                            style: textTheme.bodyLarge!.copyWith(color: Colors.grey.shade700),
                          ),
                          TextButton(
                              onPressed: () => context.push('/register'),
                              child: Text(
                                '¡Crea una ahora!',
                                style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, color: colors.primary),
                              )),
                          const SizedBox(height: 10),
                          Text(
                            'Terminos y condiciones de uso',
                            style: textTheme.bodyMedium!.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
