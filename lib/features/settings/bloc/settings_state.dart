part of 'settings_bloc.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ProfileImagePickedState extends SettingsState {
  final String path;
  ProfileImagePickedState({required this.path});
}
