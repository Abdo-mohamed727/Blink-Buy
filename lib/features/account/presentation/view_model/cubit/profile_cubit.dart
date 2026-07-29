import 'dart:io';

import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/account/domain/entities/user_entity.dart';
import 'package:blinkbuy/features/account/domain/use_cases/add_image_use_case.dart';
import 'package:blinkbuy/features/account/domain/use_cases/get_user_data_use_case.dart';
import 'package:blinkbuy/features/account/domain/use_cases/update_data_user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._getUserDataUseCase,
    this._updateDataUserUseCase,
    this._addImageUseCase,
  ) : super(ProfileInitial());

  final GetUserDataUseCase _getUserDataUseCase;
  final UpdateDataUserUseCase _updateDataUserUseCase;
  final AddImageUseCase _addImageUseCase;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  String? localImagePath;

  Future<void> getUserData() async {
    emit(ProfileLoading());

    final result = await _getUserDataUseCase();

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
    String image,
  ) async {
    final result = await _updateDataUserUseCase(
      name.isNotEmpty ? name : nameController.text,
      email.isNotEmpty ? email : emailController.text,
      phone.isNotEmpty ? phone : phoneController.text,
      address.isNotEmpty ? address : addressController.text,
      image,
    );

    switch (result) {
      case Success():
        await getUserData();

      case Error():
        emit(ProfileError(result.messageError));
    }
  }

  Future<void> addImage() async {
    final pickedFile = await pickImages();

    if (pickedFile == null) return;

    localImagePath = pickedFile.path;

    if (state is ProfileSuccess) {
      emit(ProfileSuccess((state as ProfileSuccess).userEntity));
    }
  }

  Future<void> submitFullProfile() async {
    emit(ImageLoading());

    if (localImagePath != null) {
      final imageResult = await _addImageUseCase(File(localImagePath!));

      if (imageResult is Error) {
        emit(ProfileError(imageResult.messageError));
        return;
      }

      localImagePath = null;
    }
    await getUserData();
    String currentServerImage = "";
    if (state is ProfileSuccess) {
      currentServerImage = (state as ProfileSuccess).userEntity.message.image
          .toString();
    }

    final updateResult = await _updateDataUserUseCase(
      nameController.text,
      emailController.text,
      phoneController.text,
      addressController.text,
      currentServerImage,
    );

    if (updateResult is Success) {
      await getUserData();
    } else if (updateResult is Error) {
      emit(ProfileError(updateResult.messageError));
    }
  }

  Future<XFile?> pickImages() async {
    try {
      return await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
    } catch (_) {
      return null;
    }
  }
}
