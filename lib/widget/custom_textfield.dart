import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      this.controller, this.icon, this.hintext, this.isPassword, this.isEmail,
      {Key? key, this.type = TextInputType.text})
      : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String hintext;
  final bool isPassword;
  final bool isEmail;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      height: 58,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please this field is required");
          }
          if (isEmail) {
            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                .hasMatch(value)) {
              return ("Please enter a valid email");
            }
          }
          if (isPassword) {
            RegExp regex = RegExp(r'^.{6,}$');
            if (!regex.hasMatch(value)) {
              return ("Please Enter Valid Password(Min. 6 charaters)");
            }
          }
          return null;
        },
        textInputAction:
            isPassword ? TextInputAction.done : TextInputAction.next,
        keyboardType: type,
        onSaved: (value) {
          controller.text = value.toString();
        },
        cursorColor: Colors.transparent,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintext,
          contentPadding: EdgeInsets.all(10),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
