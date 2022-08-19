import 'package:flutter/material.dart';

Widget buildTextField(BuildContext context, TextEditingController controller,
    IconData icon, String hintext, bool isPassword, bool isEmail) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12),
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
      textInputAction: isPassword ? TextInputAction.done : TextInputAction.next,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
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
        // contentPadding: EdgeInsets.all(10),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    ),
  );
}
