import 'package:flutter/material.dart';

class InputFormField extends StatefulWidget {
  final String label;
  final String? type;
  final IconData? icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool isRequired;

  const InputFormField({
    super.key,
    required this.label,
    this.type,
    this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.validator,
    this.isRequired = false ,
  });

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  bool obscure = false;
  bool isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    if (widget.type == 'password') {
      obscure = true;
    }
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 11,),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        focusNode: _focusNode,
        obscureText: obscure,
        validator: widget.validator,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
              text: widget.label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).textTheme.labelLarge?.color,
              ),
              children: widget.isRequired
                  ? [
                      TextSpan(
                        text: '       *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ]
                  : [],
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromRGBO(255, 255, 255, 0.4)
                : const Color.fromRGBO(0, 0, 0, 0.4),
          ),
          labelStyle: Theme.of(context).textTheme.labelLarge,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Icon(widget.icon,
                color: isFocused
                    ? Theme.of(context).colorScheme.onPrimary
                    : null),
          ),
          suffixIcon: widget.type == 'password'
              ? Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: IconButton(
                    color: isFocused
                        ? Theme.of(context).colorScheme.onPrimary
                        : null,
                    icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => obscure = !obscure),
                  ),
                )
              : null,
          filled: true,
          fillColor: Theme.of(context).cardColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
