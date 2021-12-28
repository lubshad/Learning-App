import 'package:learning_app/l10n/localization.dart';
import 'package:flutter/material.dart';

class AgreeToTerms extends StatelessWidget {
  const AgreeToTerms({
    Key? key,
    required this.onChange,
    required this.onPressed,
    required this.value,
  }) : super(key: key);

  final Function(bool?) onChange;
  final VoidCallback onPressed;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChange),
        Text(AppLocalizations.of(context)!.i_agree_to_the),
        TextButton(
            onPressed: onPressed,
            child: Text(
              AppLocalizations.of(context)!.terms_and_conditions,
              style: const TextStyle(decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
