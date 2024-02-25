import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/l10n/cubit/locale_cubit.dart';
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
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localeCubit.state.languageCode.isEmpty
          ? 'en'
          : localeCubit.state.languageCode),
      theme: light,
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
                print(currentBrightness.toString());
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
