import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  ImagePicker picker = ImagePicker();
  XFile image = XFile('');
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  bool active = false;
  bool male = true;

  void onPickImage() async {
    image = await pickImage();
    if (image.path.isNotEmpty) {
      await saveImage(image.path).then((value) {
        context.read<SettingsBloc>().add(PickProfileImageEvent());
      });
    }
  }

  void onSelectMale(bool value) {
    male = value;
    checkActive();
  }

  void checkActive() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onConfirm() async {
    context.read<SettingsBloc>().add(ChangeProfileNameEvent());
    await saveUser(
      controller1.text,
      controller2.text,
      male,
    ).then((value) {
      context.pop();
    });
  }

  @override
  void initState() {
    super.initState();
    controller1.text = firstName;
    controller2.text = lastName;
    male = genderMale;
    if (controller1.text.isNotEmpty && controller2.text.isNotEmpty) {
      active = true;
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
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
              onPressed: onPickImage,
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
              controller1: controller1,
              controller2: controller2,
              onChanged: checkActive,
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
                              onSelectMale(true);
                              context.pop();
                            },
                            onPressed2: () {
                              onSelectMale(false);
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
                          male ? 'Male' : 'Female',
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
              active: active,
              onPressed: onConfirm,
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
