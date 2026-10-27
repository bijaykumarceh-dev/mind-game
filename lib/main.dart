import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/localization/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'repositories/level_repository.dart';
import 'services/ad_service.dart';
import 'services/audio_service.dart';
import 'services/persistence_service.dart';
import 'viewmodels/daily_challenge_viewmodel.dart';
import 'viewmodels/shop_viewmodel.dart';
import 'viewmodels/user_progress_viewmodel.dart';
import 'views/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Future<_AppDependencies> _dependencies = _initialize();

  Future<_AppDependencies> _initialize() async {
    final persistence = await PersistenceService.init();
    final audio = AudioService();
    final progress = UserProgressViewModel(persistence, audio);
    final ads = AdService();
    unawaited(ads.initialize());
    return _AppDependencies(
      progress: progress,
      ads: ads,
      audio: audio,
      levels: LevelRepository(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_AppDependencies>(
      future: _dependencies,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
            theme: AppTheme.darkTheme,
            home: Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text('Unable to load game data: ${snapshot.error}'),
                ),
              ),
            ),
          );
        }
        if (!snapshot.hasData) {
          return MaterialApp(
            theme: AppTheme.darkTheme,
            home: const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }
        final dependencies = snapshot.data!;
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: dependencies.progress),
            Provider.value(value: dependencies.ads),
            Provider.value(value: dependencies.audio),
            Provider.value(value: dependencies.levels),
            ChangeNotifierProvider<DailyChallengeViewModel>(
              create: (context) => DailyChallengeViewModel(
                userProgressVM: context.read<UserProgressViewModel>(),
                levelRepository: context.read<LevelRepository>(),
              ),
            ),
            ChangeNotifierProvider<ShopViewModel>(
              create: (context) => ShopViewModel(
                userProgressVM: context.read<UserProgressViewModel>(),
                adService: context.read<AdService>(),
              ),
            ),
          ],
          child: Consumer<UserProgressViewModel>(
            builder: (context, progress, _) => MaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.darkTheme,
              locale: Locale(progress.languageCode),
              supportedLocales: const [Locale('en'), Locale('hi')],
              localizationsDelegates: const [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.linear(progress.textScale)),
                child: child ?? const SizedBox.shrink(),
              ),
              home: const HomeScreen(),
            ),
          ),
        );
      },
    );
  }
}

class _AppDependencies {
  final UserProgressViewModel progress;
  final AdService ads;
  final AudioService audio;
  final LevelRepository levels;

  const _AppDependencies({
    required this.progress,
    required this.ads,
    required this.audio,
    required this.levels,
  });
}
