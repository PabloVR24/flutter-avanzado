import 'package:chat_app/presentation/screens/bloc/formz_bloc/formz_bloc.dart';
import 'package:chat_app/presentation/widgets/buttons/custom_button.dart';
import 'package:chat_app/presentation/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => FormzBloc(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final formzBloc = context.watch<FormzBloc>();
    final state = formzBloc.state;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Registrarse',
              style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    insideIcon: const Icon(Icons.person),
                    label: 'Nombre',
                    hint: 'Pablo',
                    onChanged: (value) => formzBloc.add(NameChanged(value)),
                    errorMessage: state.name.errorMessage,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    insideIcon: const Icon(Icons.mail),
                    label: 'Correo',
                    hint: 'something@mail.com',
                    onChanged: (value) => formzBloc.add(EmailChanged(value)),
                    errorMessage: state.email.errorMessage,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    insideIcon: const Icon(Icons.lock),
                    label: 'Contraseña',
                    hint: '***********',
                    onChanged: (value) => formzBloc.add(PasswordChanged(value)),
                    errorMessage: state.password.errorMessage,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    insideIcon: const Icon(Icons.lock),
                    label: 'Confirma tu contraseña',
                    hint: '***********',
                    onChanged: (value) => formzBloc.add(VerifyPasswordChanged(value)),
                    errorMessage:
                        state.password.value != state.verifyPassword.value ? 'Las contraseñas deben coincidir' : state.verifyPassword.errorMessage,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed:
                        (state.email.isValid && state.password.isValid && state.name.isValid) && (state.password.value == state.verifyPassword.value)
                            ? () {
                                print('${state.name.value}, ${state.email.value}, ${state.password.value}, ${state.verifyPassword.value}');
                              }
                            : null,
                    text: 'Crear Cuenta',
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    '¿Ya tienes una cuenta?',
                    style: textTheme.bodyLarge!.copyWith(color: Colors.grey.shade700),
                  ),
                  TextButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        '¡Ingresa ahora!',
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
    );
  }
}
