part of 'app_section_cubit.dart';

@immutable
sealed class AppSectionState {}

final class AppSectionInitial extends AppSectionState {}

final class AppSectionChanged extends AppSectionState {
  final int currentIndex;

  AppSectionChanged(this.currentIndex);
}