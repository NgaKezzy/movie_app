import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/component/header_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: HeaderApp(title: AppLocalizations.of(context)!.setting),
      body: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 60,
              width: width,
              // color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
