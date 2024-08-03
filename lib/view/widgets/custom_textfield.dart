import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController controller;
  const CustomTextField(
      {Key? key, required this.onPressed, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Search City',
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.search),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
