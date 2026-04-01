import 'package:flutter/material.dart';
import 'package:movie_app/core/no_params/no_params.dart';
import 'package:movie_app/di/injection.dart';
import 'package:movie_app/features/home/domain/usecase/get_all_user_use_case.dart';
import 'package:movie_app/features/home/presentation/page/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
