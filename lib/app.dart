import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'assets/theme/theme.dart';
import 'common/di/service_locator.dart';
import 'feature/app/navigator/navigation_delegate.dart';
import 'feature/main_page/bloc/tasklist_bloc.dart';

class App extends StatefulWidget {
  final bool isDebug;

  const App({
    Key? key,
    required this.isDebug,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ServiceLocator locator = ServiceLocator();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskListBloc>(
      create: (_) => locator.bloc,
      child: OverlaySupport.global(
        child: ChangeNotifierProvider<NavigationDelegate>.value(
          value: locator.appNavigator.navigationDelegate,
          child: Consumer<NavigationDelegate>(builder: (context, delegate, _) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: widget.isDebug,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [
                Locale('en'),
                Locale('ru'),
              ],
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
              routeInformationParser:
                  locator.appNavigator.routeInforamtionParser,
              routerDelegate: delegate,
            );
          }),
        ),
      ),
    );
  }
}
