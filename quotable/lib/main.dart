import 'config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/injection_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotable/features/home/presentation/views/screen/home_screen.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_event.dart';

void main() async {
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
        return BlocProvider<RemoteQuoteBloc>(
          create: (context) => getIt()..add(const FetchRemoteQuotes()),
          child: MaterialApp(
            title: 'Quotable',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.dark,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.light,
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
