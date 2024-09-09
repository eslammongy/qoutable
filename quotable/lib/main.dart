import 'dart:async';
import 'config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/injection_container.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/config/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_bloc.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_bloc.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_events.dart';
import 'package:quotable/features/categories/presentation/bloc/category_bloc.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_states.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_event.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeDependencies();
  await ScreenUtil.ensureScreenSize();
  FlutterNativeSplash.remove();
  runApp(const Quotable());
}

class Quotable extends StatelessWidget {
  const Quotable({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppSettingsBloc>(
              create: (context) => getIt()..add(const SetAppTheme()),
            ),
            BlocProvider<RemoteQuoteBloc>(
              create: (context) => getIt(),
            ),
            BlocProvider<CategoriesBloc>(
              create: (context) => getIt(),
            ),
            BlocProvider<AuthorsBloc>(
              create: (context) => getIt(),
            ),
            BlocProvider<LocalQuoteBloc>(
              create: (context) => getIt(),
            ),
          ],
          child: BlocBuilder<AppSettingsBloc, AppSettingsStates>(
            builder: (context, state) {
              final settingBloc = AppSettingsBloc.get(context);
              return MaterialApp.router(
                title: kAppName,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: settingBloc.themeMode,
                routerConfig: AppRouter.appRoutes(),
              );
            },
          ),
        );
      },
    );
  }
}
