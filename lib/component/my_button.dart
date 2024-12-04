import 'package:flutter/material.dart';

// Button with custom style and tap handling
class MyButton extends StatelessWidget {
  final Function()? onTap;  // Action for the button press
  final String text;        // Text displayed on the button

  const MyButton({
    super.key, 
    required this.onTap, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Executes the onTap function
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),  // Rounded corners
        ),
        child: Center(
          child: Text(
            text,  // Display the text parameter
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

// Custom button with flexible styling for elevation
class CustomButton extends StatelessWidget {
  final String label;    // Button label text
  final VoidCallback onPressed;  // Action on button press
  final Color color;     // Button color

  const CustomButton({
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,  // Executes the onPressed callback
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),  // Dynamic background color
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 25)),  // Button padding
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),  // Rounded corners for custom button
        )),
      ),
      child: Text(
        label,  // Display the label text
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,  // Font size for the label
        ),
      ),
    );
  }
}
