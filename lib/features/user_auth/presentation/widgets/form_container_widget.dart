import 'package:flutter/material.dart';

import '../../../../utilis/colors/color.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const FormContainerWidget(
      {this.controller,
      this.isPasswordField,
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType});

  @override
  _FormContainerWidgetState createState() => new _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          //color: Colors.grey.withOpacity(.35),
          //borderRadius: BorderRadius.circular(0),
          ),
      child: new TextFormField(
        style: TextStyle(
            color: AppColor.color1, fontWeight: FontWeight.bold, fontSize: 18),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: new InputDecoration(
          fillColor: AppColor.color2,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.color4,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColor.color3, width: 1.0), // Change border width here
          ),
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColor.color3,
            fontSize: 14,
          ),
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color:
                        _obscureText == false ? AppColor.color4 : Colors.grey,
                  )
                : Text(""),
          ),
        ),
      ),
    );
  }
}

class SignInFormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const SignInFormContainerWidget(
      {this.controller,
      this.isPasswordField,
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType});

  @override
  State<SignInFormContainerWidget> createState() =>
      _SignInFormContainerWidgetState();
}

class _SignInFormContainerWidgetState extends State<SignInFormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          //color: Colors.grey.withOpacity(.35),
          //borderRadius: BorderRadius.circular(0),
          ),
      child: new TextFormField(
        style: TextStyle(
            color: AppColor.color1, fontWeight: FontWeight.bold, fontSize: 18),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        cursorColor: AppColor.color1,
        decoration: new InputDecoration(
          border: UnderlineInputBorder(),
          fillColor: AppColor.color2,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.color4, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.color3, width: 1.0),
          ),
          filled: true,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: AppColor.color1),
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color:
                        _obscureText == false ? AppColor.color4 : Colors.grey,
                  )
                : Text(""),
          ),
        ),
      ),
    );
  }
}
