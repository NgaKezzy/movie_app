import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/l10n/cubit/locale_cubit.dart';
import 'package:movie_app/router/router_config.dart';
import 'package:movie_app/theme/cubit/theme_cubit.dart';
import 'package:movie_app/theme/dark_theme.dart';
import 'package:movie_app/theme/light_theme.dart';

String language = 'vi';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LocaleCubit localeCubit;
  @override
  void initState() {
    localeCubit = context.read<LocaleCubit>();
    localeCubit.initLanguage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LocaleCubit localeCubit = context.watch<LocaleCubit>();
    final ThemeCubit themeCubit = context.watch<ThemeCubit>();

    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localeCubit.state.languageCode.isEmpty
          ? 'en'
          : localeCubit.state.languageCode),
      theme: themeCubit.state.isLight ? light : dark,
      routerConfig: routerConfig,
    );
  }
}
