import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project11/core/widgets/menu/menu_widget.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/profile_image.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/settings_bloc.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  ImagePicker xyzabc = ImagePicker();
  XFile qwerty = XFile('');
  final asdfgh = TextEditingController();
  final zxcvbn = TextEditingController();
  bool poiuyt = false;
  bool lkjhgf = true;

  void mnbvcx() async {
    qwerty = await pickImage();
    if (qwerty.path.isNotEmpty) {
      await saveImage(qwerty.path).then((value) {
        context.read<SettingsBloc>().add(PickProfileImageEvent());
      });
    }
  }

  void plmokn(bool value) {
    lkjhgf = value;
    qazwsx();
  }

  void qazwsx() {
    setState(() {
      if (asdfgh.text.isEmpty) {
        poiuyt = false;
      } else if (zxcvbn.text.isEmpty) {
        poiuyt = false;
      } else {
        poiuyt = true;
      }
    });
  }

  void edcrfv() async {
    context.read<SettingsBloc>().add(ChangeProfileNameEvent());
    await saveUser(
      asdfgh.text,
      zxcvbn.text,
      lkjhgf,
    ).then((value) {
      context.pop();
    });
  }

  @override
  void initState() {
    super.initState();
    asdfgh.text = firstName;
    zxcvbn.text = lastName;
    lkjhgf = genderMale;
    if (asdfgh.text.isNotEmpty && zxcvbn.text.isNotEmpty) {
      poiuyt = true;
    }
  }

  @override
  void dispose() {
    asdfgh.dispose();
    zxcvbn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const CustomAppbar('My Profile'),
            const SizedBox(height: 24),
            const ProfileImage(height: 96),
            const SizedBox(height: 16),
            CupertinoButton(
              onPressed: mnbvcx,
              padding: EdgeInsets.zero,
              minSize: 20,
              child: const Text(
                'Set New Photo',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontSize: 17,
                  fontFamily: 'SFB',
                ),
              ),
            ),
            const SizedBox(height: 24),
            _NameFields(
              controller1: asdfgh,
              controller2: zxcvbn,
              onChanged: qazwsx,
            ),
            const SizedBox(height: 24),
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Text(
                    'Select operation',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF',
                    ),
                  ),
                  const Spacer(),
                  CupertinoButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return MenuWidget(
                            top: 390,
                            title1: 'Male',
                            title2: 'Female',
                            onPressed1: () {
                              plmokn(true);
                              context.pop();
                            },
                            onPressed2: () {
                              plmokn(false);
                              context.pop();
                            },
                          );
                        },
                      );
                    },
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          lkjhgf ? 'Male' : 'Female',
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SF',
                          ),
                        ),
                        const SizedBox(width: 9),
                        SvgPicture.asset('assets/select.svg'),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            PrimaryButton(
              title: 'Confirm',
              active: poiuyt,
              onPressed: edcrfv,
            )
          ],
        ),
      ),
    );
  }
}

class _NameFields extends StatelessWidget {
  const _NameFields({
    required this.controller1,
    required this.controller2,
    required this.onChanged,
  });

  final TextEditingController controller1;
  final TextEditingController controller2;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TxtField(
            controller: controller1,
            hintText: 'First name',
            onChanged: onChanged,
          ),
          Container(
            height: 0.5,
            margin: const EdgeInsets.only(left: 16),
            color: AppColors.border,
          ),
          TxtField(
            controller: controller2,
            hintText: 'Last name',
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

String tgbyhn = '';

class Rules extends StatefulWidget {
  final String ujmiko;
  final String plokij;
  final String nbvcxz;

  const Rules(
      {super.key,
      required this.ujmiko,
      required this.plokij,
      required this.nbvcxz});

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  late AppsflyerSdk qwertyuiop;
  String asdfghjkl = '';
  String zxcvbnm = '';
  String poiuytrewq = '';
  Map lkjhgfdsa = {};
  Map mnbvcxza = {};
  bool qazwsxedc = false;
  String rfvtgbyhn = '';

  String ujmikol = '';
  String plmoknij = '';

  @override
  void initState() {
    super.initState();
    qazwsxedcr();
  }

  Future<void> qazwsxedcr() async {
    await tgbyhnu();
    await yhnujmik();
    await olpkmijn();
  }

  Future<void> tgbyhnu() async {
    final TrackingStatus status =
        await AppTrackingTransparency.requestTrackingAuthorization();
    plmoknij = status.name;
    print(status);
  }

  Future<void> yhnujmik() async {
    asdfghjkl = await AppTrackingTransparency.getAdvertisingIdentifier();
  }

  Future<void> olpkmijn() async {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: '4rYehnSYQsVcM2jmim5KyC',
      appId: '6593678360',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
      manualStart: true,
    );
    qwertyuiop = AppsflyerSdk(options);

    await qwertyuiop.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    qwertyuiop.onAppOpenAttribution((res) {
      setState(() {
        lkjhgfdsa = res;
        poiuytrewq = res['payload']
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
    });

    qwertyuiop.onInstallConversionData((res) {
      print(res);
      setState(() {
        mnbvcxza = res;
        qazwsxedc = res['payload']['is_first_launch'];
        rfvtgbyhn = res['payload']['af_status'];
        zxcvbnm = '&is_first_launch=$qazwsxedc&af_status=$rfvtgbyhn';
      });
    });

    qwertyuiop.onDeepLinking((DeepLinkResult dp) {
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
      setState(() {
        lkjhgfdsa = dp.toJson();
      });
    });

    tgbyhn = await qwertyuiop.getAppsFlyerUID() ?? '';
    setState(() {});
    print('AppsFlyer ID: $tgbyhn');

    qwertyuiop.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK initialized successfully.");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String wsxedcrfv =
        '${widget.ujmiko}${widget.plokij}&appsflyer_id=$tgbyhn';
    print(wsxedcrfv);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(wsxedcrfv),
          ),
        ),
      ),
    );
  }
}
