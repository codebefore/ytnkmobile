import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:wonderpush_flutter/wonderpush_flutter.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/blocs/default_bloc_observer.dart';
import 'package:ytnkio/blocs/survey/survey_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/go_routes.dart';
import 'package:ytnkio/services/common/connectivity_service.dart';
import 'package:ytnkio/services/base/service_base.dart';

import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/widgets/common/connectivity_checker.dart';
import 'package:ytnkio/widgets/common/processing_indicator.dart';

import 'firebase_options.dart';

class _AppWonderPushDelegate implements WonderPushDelegate {
  final void Function(Map<String, dynamic> notification) _onReceived;
  final void Function(Map<String, dynamic> notification, int buttonIndex)
      _onOpened;

  _AppWonderPushDelegate({
    required void Function(Map<String, dynamic> notification) onReceived,
    required void Function(Map<String, dynamic> notification, int buttonIndex)
        onOpened,
  })  : _onReceived = onReceived,
        _onOpened = onOpened;

  @override
  void onNotificationReceived(Map<String, dynamic> notification) {
    _onReceived(notification);
  }

  @override
  void onNotificationOpened(
      Map<String, dynamic> notification, int buttonIndex) {
    _onOpened(notification, buttonIndex);
  }
}

void _refreshMatchesIfPossible(GlobalBloc globalBloc) {
  final profileId = globalBloc.state.profile.id;
  if (!globalBloc.state.isAuthenticated || profileId.isEmpty) {
    return;
  }

  globalBloc.add(RetrieveUsersMatchesEvent(profileId: profileId));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = ServiceBaseHttpOverrides();

  //FIREBASE GOOGLE AUTH İÇİN YENİDEN BİLGİLER DÜZENLENECEK VE FIREBASEOPTIONS DOSYASI KULLANILACAK
  //FLUTTERFIRE YENİ VERSİYONDA KOTLIN UYUMLU BUILD.GRADLE.KTS DOSYALARIYLA ÇALIŞMADIĞI İÇİN FIREBASEOPTIONS GÜNCELLENEMEDİ
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //ONESIGNAL YENİ GRADLE VERSİYONUNDA DERLEMEYE ENGEL OLDUĞU İÇİN KALDIRILDI
  // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // OneSignal.initialize(<APIKEY>);
  // OneSignal.Notifications.requestPermission(true);

  Bloc.observer = DefaultBlocObserver();
  final globalBloc = GlobalBloc()
    ..add(RetrieveDeviceIdEvent())
    ..add(RetrieveLandingStatusEvent())
    ..add(RestoreSessionEvent());

  WonderPush.setDelegate(_AppWonderPushDelegate(
    onReceived: (notification) {
      _refreshMatchesIfPossible(globalBloc);
    },
    onOpened: (notification, buttonIndex) {
      _refreshMatchesIfPossible(globalBloc);
    },
  ));

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => ConnectivityService(
            serviceUrl: ServiceBase().apiUrl + ServiceBase().livenessCheckUrl,
          ),
        ),
      ],
      child: YtnkioApp(globalBloc: globalBloc),
    ),
  );

  configLoading();
}

void configLoading() {
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.wanderingCubes;
}

class YtnkioApp extends StatelessWidget {
  final GlobalBloc globalBloc;

  const YtnkioApp({required this.globalBloc, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: globalBloc,
        ),
        BlocProvider(
          create: (context) => SurveyBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: GoRoutes.router,
        title: GlobalConstants.appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            },
          ),
        ),
        builder: EasyLoading.init(
          builder: (context, child) {
            return ChangeNotifierProvider(
              create: (context) => GlobalTexts.instance,
              child: Stack(
                children: [
                  child!,
                  const ProcessingIndicator(),
                  const ConnectivityChecker(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
