import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sastra_ebooks/Misc/constants.dart';

import '../customTextFormField.dart';

class RegNumTextFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RegNumTextFormField({
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: onChanged,
      labelText: kRegNumString,
      validator: (String _input) {
        if (_input.isEmpty) {
          return kRegNumFieldEmptyString;
        }
        return null;
      },
      autovalidate: true,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(9),
      ],
      //initialValue: '121003219',
    );
  }
}
