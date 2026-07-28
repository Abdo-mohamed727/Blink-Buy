import 'dart:io';

import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/account/domain/entities/user_entity.dart';
import 'package:blinkbuy/features/account/domain/use_cases/get_user_data_use_case.dart';
import 'package:blinkbuy/features/account/domain/use_cases/update_data_user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._getUserDataUseCase, this._updateDataUserUseCase)
    : super(ProfileInitial());
  final GetUserDataUseCase _getUserDataUseCase;
  final UpdateDataUserUseCase _updateDataUserUseCase;

  Future<void> getUserData() async {
    emit(ProfileLoading());
    final result = await _getUserDataUseCase.call();
    switch (result) {
      case Success():
        emit(ProfileSuccess(result.data));
      case Error():
        emit(ProfileError(result.messageError));
    }
  }

  Future<void> updateUserData(
    String name,
    String email,
    String phone,
    String address,
    File file,
  ) async {
    emit(UpdateProfileLoading());
    final result = await _updateDataUserUseCase.call(
      name,
      email,
      phone,
      address,
      file,
    );
    switch (result) {
      case Success():
        emit(UpdateProfileSuccess());
      case Error():
        emit(UpdateProfileError(result.messageError));
    }
  }
}
