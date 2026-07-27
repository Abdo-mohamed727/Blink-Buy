// ignore_for_file: must_be_immutable

import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:flutter/material.dart';


class SearchWidget extends StatelessWidget {
   SearchWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
   final onChanged;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'Search for your products',
      hintStyle: TextStyles.font14Regular,
      maxLines: 1,
      onChanged: onChanged,
    );
  }
}