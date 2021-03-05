import 'package:flutter/material.dart';

class TextFormFieldExt extends StatelessWidget {
  String _labelText;
  Icon _prefixIcon;
  TextEditingController _controller;
  TextInputType _keyboardType;
  bool _obscureText;
  Function(String) _validator;
  Function _onChanged;

  TextFormFieldExt(
      {String labelText,
      Icon prefixIcon,
      TextEditingController controller,
      TextInputType keyboardType,
      bool obscureText,
      Function(String) validator,
      Function onChanged}) {
    this._labelText = labelText;
    this._prefixIcon = prefixIcon;
    this._controller = controller;
    this._keyboardType = keyboardType;
    this._obscureText = obscureText;
    this._validator = validator;
    this._onChanged = onChanged;
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        controller: _controller,
        keyboardType: _keyboardType ?? TextInputType.text,
        obscureText: _obscureText ?? false,
        validator: _validator,
        decoration: InputDecoration(
            labelText: _labelText ?? '', 
            prefixIcon: _prefixIcon,
            ),
        onChanged: _onChanged,
      ),
    );
  }
}