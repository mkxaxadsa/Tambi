import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<ChangeProfileNameEvent>((event, emit) {
      emit(SettingsInitial());
    });

    on<PickProfileImageEvent>((event, emit) {
      emit(ProfileImagePickedState(path: imagePath));
    });
  }
}
