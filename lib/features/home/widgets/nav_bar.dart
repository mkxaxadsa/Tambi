import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/app_colors.dart';
import '../bloc/home_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 62 + MediaQuery.of(context).viewPadding.bottom,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.black,
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: const Color(0xff3C3C43).withOpacity(0.36),
            ),
          ),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  title: 'Finance',
                  asset: 'tab1',
                  active: state is HomeInitial,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 0));
                  },
                ),
                _NavBarButton(
                  title: 'News',
                  asset: 'tab2',
                  active: state is HomeNews,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 1));
                  },
                ),
                _NavBarButton(
                  title: 'Quiz',
                  asset: 'tab3',
                  active: state is HomeQuiz,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 2));
                  },
                ),
                _NavBarButton(
                  title: 'Settings',
                  asset: 'tab4',
                  active: state is HomeSettings,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 3));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.title,
    required this.asset,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: 62,
        height: 62,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 7),
            SizedBox(
              height: 40,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/$asset.svg',
                    height: 22,
                    color: active ? AppColors.yellow : AppColors.grey,
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                      color: active ? AppColors.yellow : AppColors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SFM',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
