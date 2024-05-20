//import 'package:todoapp/feature/auth/presentation/views_models/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/auth/presentation/autho/views_models/login_cubit/login_cubit.dart';
import 'package:todoapp/feature/home/presentation/modelview/home_cubit/home_cubit.dart';
import 'package:todoapp/feature/home/presentation/view/widget/homeview_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
          appBar: AppBar(
            leading: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(LoginCubit.of(context).user.image ??
                  'https://t3.ftcdn.net/jpg/03/46/83/96/240_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
            ),
            
          ),
          body: const HomeViewBody()),
    );
  }
}
