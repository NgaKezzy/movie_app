import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/component/header_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/theme/cubit/theme_cubit.dart';
import 'package:movie_app/theme/cubit/theme_state.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ThemeCubit themeCubit = context.watch<ThemeCubit>();
    return Scaffold(
      appBar: HeaderApp(title: AppLocalizations.of(context)!.setting),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            width: width,
            // color: Colors.red,\
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark mode'),
                Switch(
                  // This bool value toggles the switch.
                  value: themeCubit.state.isDark,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    context.read<ThemeCubit>().toggedTheme();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
