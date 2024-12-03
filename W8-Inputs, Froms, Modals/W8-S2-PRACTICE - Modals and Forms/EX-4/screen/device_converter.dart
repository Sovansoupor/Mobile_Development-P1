import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_project/W8-S2-ModalsandForms/EX-4/button/device_button.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final _amountController = TextEditingController();
  Currency selectedCurrency = Currency.euro;
  double convertedAmount = 0.0;

  String get amount => _amountController.text;

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  // Conversion rate
  final Map<Currency, double> conversionRates = {
    Currency.euro: 0.9,
    Currency.riels: 4100.0,
    Currency.dong: 23000.0,
  };

  void convertAmount() {
    final double amount = double.tryParse(_amountController.text) ?? 0.0;
    setState(() {
      convertedAmount = amount * conversionRates[selectedCurrency]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),

          // Amount box
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true), //allow decimal
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              controller: _amountController,
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              onChanged: (value) => convertAmount(),
              style: const TextStyle(color: Colors.white)),

          // Drop down currency
          const SizedBox(height: 30),
          DropdownDevices(
            selectedCurrency: selectedCurrency,
            onCurrencyChanged: (Currency newCurrency) {
              setState(() {
                selectedCurrency = newCurrency;
                convertAmount();
              });
            },
          ),

          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: textDecoration,
            child: Text(
              convertedAmount.toStringAsFixed(2),
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      )),
    );
  }
}
