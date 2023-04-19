import "package:flutter/material.dart";

class AddressTextField extends StatefulWidget {
  const AddressTextField({
    Key? key,
    this.width,
    this.hintText,
    required this.controller,
    // this.obscureText,
    this.validator,
    required this.label,
    this.icon,
    // required this.onUpdateTap,
    this.inputType,
  }) : super(key: key);

  final double? width;
  final String? hintText;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? icon;
  final TextInputType? inputType;

  @override
  State<AddressTextField> createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = widget.width ?? MediaQuery.of(context).size.width;
    var passwordVisible = true;
    return Container(
      width: w,
      // height: 60,
      // color: Colors.red,
      margin: const EdgeInsets.only(top: 25),
      child: TextFormField(
          onChanged: (data) {},
          textAlign: TextAlign.start,
          textCapitalization: TextCapitalization.sentences,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: 1,
          scrollPhysics: AlwaysScrollableScrollPhysics(),
          validator: widget.validator,
          keyboardType: widget.inputType,
          autofocus: false,
          controller: widget.controller,
          decoration: InputDecoration(
            errorMaxLines: 2,
            isCollapsed: true,
            contentPadding: const EdgeInsets.fromLTRB(12, 20, 0, 12),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: Color.fromRGBO(245, 147, 163, 1.0),
            )),
            label: Text(widget.label),
            labelStyle: TextStyle(color: Colors.black.withOpacity(.7)),
            floatingLabelStyle: TextStyle(color: Colors.black.withOpacity(.3)),
            suffixIcon: widget.icon != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.icon,
                  )
                : null,
            suffixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 24),
          )),
    );
  }
}
