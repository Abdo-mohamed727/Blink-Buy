import 'package:blinkbuy/features/account/presentation/view/screens/account_screen.dart';
 

import 'package:blinkbuy/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:blinkbuy/features/favourite/presentation/view/screens/favourite_screen.dart';
import 'package:blinkbuy/features/home/presintation/view/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'app_section_state.dart';

class AppSectionCubit extends Cubit<AppSectionState> {
  AppSectionCubit() : super(AppSectionInitial());
  int currentIndex = 0;
   final List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
    AccountScreen(),
  ];

  void changeSection(int index) {
    currentIndex = index;
    emit(AppSectionChanged(currentIndex));
  }
}
