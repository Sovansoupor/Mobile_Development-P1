import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom buttons'),
          centerTitle: false,
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomButton(
                  label: "Submit",
                  icon: Icons.check,
                  iconPosition: IconPosition.left,
                  buttonType: ButtonType.primary,
                ),
                SizedBox(height: 16),
                CustomButton(
                  label: "Time",
                  icon: Icons.access_time,
                  iconPosition: IconPosition.left,
                  buttonType: ButtonType.secondary,
                ),
                SizedBox(height: 16),
                CustomButton(
                  label: "Account",
                  icon: Icons.account_circle,
                  iconPosition: IconPosition.right,
                  buttonType: ButtonType.disabled,
                ),
              ],
            ),
          ),
        )),
  ));
}

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  const ButtonType(this.color);
}

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.label,
      required this.icon,
      this.iconPosition = IconPosition.left,
      this.buttonType = ButtonType.primary,
      super.key});

  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled ? null : () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonType.color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0)),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconPosition == IconPosition.left
              ? [
                  Icon(icon, size: 20),
                  const SizedBox(width: 8),
                  Text(label),
                ]
              : [
                  Text(label),
                  const SizedBox(width: 8),
                  Icon(icon, size: 20),
                ]),
    );
  }
}
