import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_bloc.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_events.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_states.dart';

AppBar customAppBar(BuildContext context) {
  final appSettingsBloc = BlocProvider.of<AppSettingsBloc>(context);
  return AppBar(
    backgroundColor: context.theme.appColors.background,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    title: Row(
      children: [
        Image.asset(
          AppAssets.quotes,
          width: 32,
        ),
        const SizedBox(width: 8),
        Text(
          kAppName,
          textAlign: TextAlign.start,
          style: TextStyles.font20Bold,
        ),
      ],
    ),
    actions: [
      BlocBuilder<AppSettingsBloc, AppSettingsStates>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              final isLight = appSettingsBloc.themeMode == ThemeMode.light;
              appSettingsBloc.add(ChangeAppTheme(isLight: !isLight));
            },
            icon: Icon(appSettingsBloc.themeMode == ThemeMode.dark
                ? Icons.brightness_6_rounded
                : Icons.brightness_4_outlined),
          );
        },
      )
    ],
  );
}
