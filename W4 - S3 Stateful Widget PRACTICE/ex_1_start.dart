import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final bool isSelected;
  const CustomButton({
    required this.isSelected,
    super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late bool isSelected;
  
  // getter for text and color
  String get buttonText => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color? get backgroundColor => isSelected ? Colors.blue[500] : Colors.blue[50];

  @override
  void initState(){
    super.initState();
    isSelected = widget.isSelected;
  }
  void clickButton(){
    setState(() {
      isSelected = !isSelected;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
          onPressed: clickButton,
          style: ElevatedButton.styleFrom(
           backgroundColor:backgroundColor
           ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
              ),
            ),
          )),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          
          child: Column(
            children: [
              CustomButton(isSelected: false),
               SizedBox(height: 20),
              CustomButton(isSelected: true),
               SizedBox(height: 20),
              CustomButton(isSelected: false),
               SizedBox(height: 20),
              CustomButton(isSelected: true),
            ],
          ),
        ),
      ),
    ));
