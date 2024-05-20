import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/utils/storage/shared_preference.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/login_view.dart';
import 'package:todoapp/feature/auth/presentation/autho/views_models/login_cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preference.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 160, 158, 157)),
            useMaterial3: true,
          ),
          home: const LoginView()),
    );
  }
}
