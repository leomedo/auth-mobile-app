import 'package:flutter/material.dart';

import '../theme/my_text_style.dart';

class MyForm extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  final TextEditingController? controller ;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final bool showText;
  final bool? enabled;
  final String? initialValue;
  final TextStyle? style;
  const MyForm({super.key,required this.labelText, this.controller,this.validator, this.onChanged, this.showText=false,this.suffixIcon, this.enabled, this.initialValue, this.style});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(labelText,style: MyTextStyle.labelTextStyle),
      subtitle: TextFormField(
        validator: validator,
        obscureText: showText,
        controller: controller,
        onChanged: onChanged,
        enabled: enabled,
        style: style,
        initialValue: initialValue,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
      ),
    );
  }
}
