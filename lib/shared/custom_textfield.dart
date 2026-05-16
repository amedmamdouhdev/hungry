import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.isPasswrd,
    required this.controller,
  });
  final String hint;
  final bool isPasswrd;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPasswrd;
    super.initState();
  }

  void _toggelPAssword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'you should fill ${widget.hint}';
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.isPasswrd
            ? GestureDetector(
                onTap: _toggelPAssword,
                child: _obscureText
                    ? Icon(Icons.visibility_off, color: Colors.grey)
                    : Icon(Icons.visibility, color: Colors.grey),
              )
            : null,
        hint: Text(widget.hint),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
