import 'dart:async';
import 'config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/injection_container.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/config/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_bloc.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_bloc.dart';
import 'package:quotable/features/categories/presentation/bloc/category_bloc.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_states.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await ScreenUtil.ensureScreenSize();
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
            BlocProvider<RemoteQuoteBloc>(
              create: (context) => getIt()..add(const FetchRemoteQuotes()),
            ),
            BlocProvider<AppSettingsBloc>(
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
              final themeMode =
                  BlocProvider.of<AppSettingsBloc>(context).themeMode;
              return MaterialApp.router(
                title: kAppName,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeMode,
                routerConfig: AppRouter.appRoutes(),
              );
            },
          ),
        );
      },
    );
  }
}
