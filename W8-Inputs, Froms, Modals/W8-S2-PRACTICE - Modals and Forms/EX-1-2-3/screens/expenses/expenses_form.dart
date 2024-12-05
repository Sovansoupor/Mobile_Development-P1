import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';
import '../../buttons/category_button.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

List<Category> get allCategories => Category.values;

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category? selectValue;
  DateTime selectedDate = DateTime.now(); // Default date: current date
  DateTime? _selectDate;

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double? amount = double.tryParse(_valueController.text);

    // 2 -  Validate the inputs
    bool isTitleValid = title.trim().isNotEmpty;
    bool isAmountValid = amount != null && amount > 0;
    bool isCategorySelected = selectValue != null;
    bool valid = isTitleValid && isAmountValid;

    // 2- Create the expense
    if (valid) {
      Expense expense = Expense(
          title: title,
          amount: amount,
          date: selectedDate,
          category: selectValue!);

      // 3- Ask the parent to add the expense
      widget.onCreated(expense);

      // 4- Close modal
      Navigator.pop(context);
    } else {
      // 4.1 Compute the error message
      String errorMessage = !isTitleValid
          ? "The title cannot be empty"
          : !isCategorySelected
              ? "Please select a category"
              : "The amount shall be a positive number";

      // 4.2 Show error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  

  // Date Picker
  Future<void> selectDate() async {
    // Open the date picker dialog
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectDate) {
      setState(() {
        _selectDate = picked; // Update the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // for title
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              // Amount
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  //maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Date picker button
              Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectDate == null 
                      ? 'Select Date'
                      : DateFormat('yyyy-MM-dd').format(_selectDate!),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: selectDate, 
                      icon: const Icon(Icons.calendar_month_outlined)
                      ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 20),
          // Drop down button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: DropdownCategory(
                  onChanged: (Category? value) {
                    setState(() {
                      selectValue = value;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: onCancel, child: const Text('Cancel')),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: onAdd, child: const Text('Save Expense')),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
