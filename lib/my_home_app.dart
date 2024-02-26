import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/print_color.dart';
import 'package:movie_app/feature/download/download_page.dart';
import 'package:movie_app/feature/home/home_page.dart';
import 'package:movie_app/feature/me/me_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:movie_app/feature/explore/explore_page.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    const HomePage(),
    const ExplorePage(),
    const DownloadPage(),
    const MePage(),
    // const MeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        unselectedIconTheme: IconThemeData(color: theme.colorScheme.tertiary),
        // selectedIconTheme: const IconThemeData(color: Colors.green),
        // selectedItemColor: Colors.green,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            pageIndex = value;

            printRed(value.toString());
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: AppLocalizations.of(context)?.home,
            activeIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: theme.colorScheme.primary,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/package.svg'),
            label: AppLocalizations.of(context)?.explore,
            activeIcon: SvgPicture.asset(
              'assets/icons/package.svg',
              color: theme.colorScheme.primary,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/download.svg'),
            label: AppLocalizations.of(context)?.download,
            activeIcon: SvgPicture.asset(
              'assets/icons/download.svg',
              color: theme.colorScheme.primary,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/user.svg'),
            label: AppLocalizations.of(context)?.me,
            activeIcon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
