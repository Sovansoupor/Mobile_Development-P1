import 'package:flutter/material.dart';
// import 'package:flutter_first_project/W8-S2-ModalsandForms/EX-4/screen/device_converter.dart';

enum Currency {
  euro,
  riels,
  dong,
}

class DropdownDevices extends StatefulWidget {
  final Currency selectedCurrency;
  final ValueChanged<Currency> onCurrencyChanged;

  const DropdownDevices(
      {required this.selectedCurrency,
      required this.onCurrencyChanged,
      super.key});

  @override
  State<DropdownDevices> createState() => _DropdownDevicesState();
}

class _DropdownDevicesState extends State<DropdownDevices> {
  Currency initialValue = Currency.euro;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Currency>(
      value: initialValue,
      icon: const Icon(Icons.arrow_drop_down),
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 1,
        color: Colors.grey,
      ),
      items: Currency.values.map((Currency currency) {
        return DropdownMenuItem<Currency>(
          value: currency,
          child: Row(
            children: [
              const SizedBox(width: 10),
              Text(
                currency.toString().split('.').last.toUpperCase(),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        if (newValue != null) {
          widget.onCurrencyChanged(newValue);
        }
      },
    );
  }
}
