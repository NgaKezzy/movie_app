import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/l10n/cubit/locale_cubit.dart';
import 'package:movie_app/theme/cubit/theme_cubit.dart';
import 'package:movie_app/theme/dark_theme.dart';
import 'package:movie_app/theme/light_theme.dart';

String language = 'vi';
void main() {
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleCubit localeCubit = context.watch<LocaleCubit>();
    final ThemeCubit themeCubit = context.watch<ThemeCubit>();

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localeCubit.state.languageCode.isEmpty
          ? 'en'
          : localeCubit.state.languageCode),
      theme: themeCubit.state.isLight ? light : dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final LocaleCubit localeCubit = context.read<LocaleCubit>();
    final ThemeCubit themeCubit = context.read<ThemeCubit>();

    Brightness currentBrightness = Theme.of(context).brightness;
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.helloWorld,
              style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                themeCubit.toggedTheme();
              },
              child: Text(
                AppLocalizations.of(context)!.changeTheme,
                style: TextStyle(color: theme.colorScheme.tertiary),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  localeCubit.setLanguageCode();
                },
                child: Text(AppLocalizations.of(context)!.changeLanguage)),
          ],
        ),
      ),
    );
  }
}
