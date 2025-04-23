import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final String? type;
  final IconData? icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hintText;

  const InputField({
    super.key,
    required this.label,
    this.type,
    this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.hintText,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
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
        print('Focus changed: $isFocused');
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
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      focusNode: _focusNode,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
            ? Color.fromRGBO(255, 255, 255, 0.4) 
            : Color.fromRGBO(0, 0, 0, 0.4), 
    ),
        labelStyle: Theme.of(context).textTheme.labelLarge,
        
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Icon(widget.icon, color: isFocused ? Theme.of(context).colorScheme.onPrimary : null),
         ),
        suffixIcon: widget.type == 'password'
            ? Padding(
              padding: EdgeInsets.only(right: 18),
              child: IconButton(
                color: isFocused ? Theme.of(context).colorScheme.onPrimary: null,
                icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => obscure = !obscure),
              )
            ): null,
        filled: true,
        fillColor: Theme.of(context).cardColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// Widget InputField({
//   required BuildContext context,
//   required String label,
//   String? type,
//   IconData? icon,
//   required TextEditingController controller,
//   TextInputType keyboardType = TextInputType.text,
//   bool obscure = false,
//   String? hintText,
// }) {
//   return TextField(
//     controller: controller,
//     keyboardType: keyboardType,
//     obscureText: obscure,
//     decoration: InputDecoration(
//       labelText: label,
//       hintText: hintText,
//       labelStyle: TextStyle(
//         color: Theme.of(context).colorScheme.onSurface,
//       ),
//       prefixIcon: Icon(icon, color: Colors.amber, ),
//       suffixIcon: type == 'password' ?  IconButton(
//           icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
//           onPressed: () => setState(() => obscure = !obscure),
//         ): null,
//       filled: true,
//       fillColor: Theme.of(context).cardColor,
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 2),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       prefixIconColor: Theme.of(context).colorScheme.onPrimary ,
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey, width: 1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ),
//   );
// }
