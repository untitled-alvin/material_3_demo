import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_settings_state.dart';
part 'app_settings_cubit.freezed.dart';

class AppSettingsCubit extends HydratedCubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsState.initial());

  void toggleCompact() => emit(state.copyWith(compact: !state.compact));

  void toggleSSO() => emit(state.copyWith(sso: !state.sso));

  @override
  AppSettingsState? fromJson(Map<String, dynamic> json) {
    return json['value'] as AppSettingsState;
  }

  @override
  Map<String, dynamic> toJson(AppSettingsState state) => {'value': state};
}
