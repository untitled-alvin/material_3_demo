part of 'app_settings_cubit.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  factory AppSettingsState({
    required bool compact,
    required bool shortcuts,
    required bool sso,
  }) = _AppSettingsState;

  AppSettingsState._();

  factory AppSettingsState.initial() {
    return AppSettingsState(compact: true, shortcuts: true, sso: true);
  }
}

// const factory AppSettingsState.initial() = _Initial;
