import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/app_size.dart';
import 'package:movie_app/l10n/cubit/locale_cubit.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late LocaleCubit localeCubit;
  @override
  void initState() {
    localeCubit = context.read<LocaleCubit>();
    localeCubit.checkIsSelectedLanguage();
    Timer(const Duration(seconds: 3), () {
      context.go(localeCubit.state.isSelectLanguage
          ? '/selectLanguage/home'
          : '/selectLanguage');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Shimmer.fromColors(
            baseColor: theme.colorScheme.error,
            highlightColor: Colors.yellow,
            child: const Text(
              'My Film',
              style: TextStyle(
                  fontSize: AppSize.size50, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
