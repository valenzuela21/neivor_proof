import 'package:flutter/material.dart';
class SwitchApp extends StatefulWidget {
  const SwitchApp({Key? key}) : super(key: key);

  @override
  State<SwitchApp> createState() => _SwitchAppState();
}

class _SwitchAppState extends State<SwitchApp> {
  bool light = true;
  @override
  Widget build(BuildContext context) {

    final MaterialStateProperty<Color?> trackColor =
    MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Theme.of(context).colorScheme.tertiary.withOpacity(0.54);
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );

    final MaterialStateProperty<Color?> overlayColor =
    MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.grey.withOpacity(0.54);
        }
        // Material color when switch is disabled.
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );

    return Switch(
      value: light,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor:  MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary),
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}
