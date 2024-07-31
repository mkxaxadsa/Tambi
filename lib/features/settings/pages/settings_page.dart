import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/profile_image.dart';
import '../bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 44),
          ProfileImage(height: 96),
          SizedBox(height: 16),
          _UserName(),
          SizedBox(height: 24),
          _ProfileTile(
            title: 'My Profile',
            asset: 'profile1',
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SupportPrivacy(
                      data: 'https://forms.gle/7FHeUTcs6H939JLGA'),
                ),
              );
            },
            child: _ProfileTilex(
              title: 'Support',
              asset: 'profile2',
            ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SupportPrivacy(
                      data:
                          'https://docs.google.com/document/d/1motCbBHMsOz8dBRplPasNkGbOVOEhxSJjUXLYy9g9bY/edit?usp=sharing'),
                ),
              );
            },
            child: _ProfileTilex(
              title: 'Privacy Policy',
              asset: 'profile3',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SupportPrivacy(
                      data:
                          'https://docs.google.com/document/d/1g3_2FIFWW0-Rr8niLa9t2eVU323FIEpfgvQ1TyJ8QCQ/edit?usp=sharing'),
                ),
              );
            },
            child: _ProfileTilex(
              title: 'Terms & Conditions',
              asset: 'profile4',
            ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              Share.share(
                'Take control of your finances with Tambi FinH! '
                'This smart budget assistant helps you track expenses, '
                'set financial goals, and make informed decisions. '
                'Download now and start your journey to financial freedom! '
                'https://apps.apple.com/app/tambi-finh',
                subject:
                    'Check out Tambi FinH - Your Personal Budget Assistant',
              );
            },
            child: _ProfileTilex(
              title: 'Share app',
              asset: 'profile5',
            ),
          ),
        ],
      ),
    );
  }
}

class SupportPrivacy extends StatefulWidget {
  const SupportPrivacy({super.key, required this.data});
  final String data;

  @override
  State<SupportPrivacy> createState() => _SupportPrivacyState();
}

class _SupportPrivacyState extends State<SupportPrivacy> {
  var _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: Container(
          child: InkWell(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            InAppWebView(
              onLoadStop: (controller, url) {
                controller.evaluateJavascript(
                    source:
                        "javascript:(function() { var ele=document.getElementsByClassName('docs-ml-header-item docs-ml-header-drive-link');ele[0].parentNode.removeChild(ele[0]);var footer = document.getelementsbytagname('footer')[0];footer.parentnode.removechild(footer);})()");
              },
              onProgressChanged: (controller, progress) => setState(() {
                _progress = progress;
              }),
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.data),
              ),
            ),
            if (_progress != 100)
              Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Text(
          '$firstName $lastName',
          style: const TextStyle(
            color: AppColors.text,
            fontSize: 21,
            fontWeight: FontWeight.w600,
            fontFamily: 'SFB',
          ),
        );
      },
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.title,
    required this.asset,
  });

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          if (asset == 'profile1') {
            context.push('/profile');
          }
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 16),
            SvgPicture.asset('assets/$asset.svg'),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 15,
                fontFamily: 'SF',
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.grey,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class _ProfileTilex extends StatelessWidget {
  const _ProfileTilex({
    required this.title,
    required this.asset,
  });

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 16),
            SvgPicture.asset('assets/$asset.svg'),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 15,
                fontFamily: 'SF',
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.grey,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile2 extends StatelessWidget {
  const _ProfileTile2({
    required this.title,
    required this.title2,
    required this.asset,
    required this.asset2,
  });

  final String title;
  final String title2;
  final String asset;
  final String asset2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CupertinoButton(
            onPressed: () {},
            minSize: 48,
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                const SizedBox(width: 16),
                SvgPicture.asset('assets/$asset.svg'),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 15,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.grey,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Container(
            height: 0.5,
            margin: const EdgeInsets.only(left: 48),
            color: AppColors.border,
          ),
          CupertinoButton(
            onPressed: () {},
            minSize: 48,
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                const SizedBox(width: 16),
                SvgPicture.asset('assets/$asset2.svg'),
                const SizedBox(width: 8),
                Text(
                  title2,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 15,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.grey,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
