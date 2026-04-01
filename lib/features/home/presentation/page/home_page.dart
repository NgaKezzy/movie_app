import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/injection.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<HomeBloc>(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({super.key});

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  late final HomeBloc homeBloc;
  @override
  void initState() {
    super.initState();
    homeBloc = context.read();
    homeBloc.add(HomeEvent.getAllUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) => Text(state.users[index].email),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: state.users.length,
          );
        },
      ),
    );
  }
}
