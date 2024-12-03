import 'package:flutter/material.dart';
import 'package:flutter_first_project/W8-S2-ModalsandForms/EX-1-2-3/models/expense.dart';

class DropdownCategory extends StatefulWidget {
  // final Category category;
  final ValueChanged<Category?> onChanged;
  const DropdownCategory({
    required this.onChanged,
    super.key});

  @override
  State<DropdownCategory> createState() => _DropdownCategoryState();
}

List <Category> get allCategories => Category.values;

class _DropdownCategoryState extends State<DropdownCategory> {
  Category selectValue = Category.leisure;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      value: selectValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (Category? newValue) {
        if (newValue != null) {
          setState(() {
            selectValue = newValue;
          });
          widget.onChanged(selectValue);
        }
      },
      items: allCategories.map((Category category){
        return DropdownMenuItem<Category>(
          value: category,
          child: Row(
            children: [
              Icon(category.icon),
              const SizedBox(width: 10),
              Text(
                category.toString().split('.').last.toUpperCase(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}