import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
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

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => ConnectivityService(
            serviceUrl: ServiceBase().apiUrl + ServiceBase().livenessCheckUrl,
          ),
        ),
      ],
      child: const YtnkioApp(),
    ),
  );

  configLoading();
}

void configLoading() {
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.wanderingCubes;
}

class YtnkioApp extends StatelessWidget {
  const YtnkioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlobalBloc()
            ..add(RetrieveDeviceIdEvent())
            ..add(RetrieveLandingStatusEvent()),
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
