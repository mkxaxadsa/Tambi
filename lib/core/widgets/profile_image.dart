import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/settings/bloc/settings_bloc.dart';
import '../utils.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        String path = imagePath;

        if (state is ProfileImagePickedState) path = state.path;

        return Center(
          child: Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 2),
            ),
            child: path.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(48),
                    child: Image.file(
                      File(path),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // return SvgPicture.asset('assets/profile_photo.svg');
                        return Image.asset('assets/user.jpg');
                      },
                    ),
                  )
                : SvgPicture.asset('assets/profile_photo.svg'),
          ),
        );
      },
    );
  }
}
