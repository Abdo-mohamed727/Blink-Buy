part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserEntity userEntity;
  ProfileSuccess(this.userEntity);
}

final class ProfileError extends ProfileState {
  final String messageError;
  ProfileError(this.messageError);
}

final class UpdateProfileLoading extends ProfileState {}

final class UpdateProfileSuccess extends ProfileState {}

final class UpdateProfileError extends ProfileState {
  final String messageError;
  UpdateProfileError(this.messageError);
}
