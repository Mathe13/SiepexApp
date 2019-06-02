import 'package:flutter/material.dart';
// import '../models/config.dart';

class OutlineInput extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final bool hasFunction;
  final type, label, hint, err, controller, disabled, cpfCnpj;
  var valor;
  OutlineInput(
      {Key key,
      this.type,
      this.valor = '',
      this.hint,
      this.label,
      this.err,
      this.controller,
      this.disabled,
      this.onChanged,
      this.hasFunction = false,
      this.cpfCnpj})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (valor != '') {
      controller.text = valor;
      valor = '';
    }
    return TextField(
      onChanged: (text) {
        if (hasFunction) {
          onChanged(text);
        }
        if (cpfCnpj == true) {
          if (text.length > 14) {
            controller.updateMask("000.000.000/0000-00");
          } else {
            controller.updateMask("000.000.000-000");
          }
        }
      },
      enabled: disabled == true ? false : true,
      controller: controller,
      obscureText: type == 'senha' ? true : false,
      keyboardType: type == "numero"
          ? TextInputType.number
          : type == "email" ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
          enabledBorder: err == true
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5))
              : OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff2595A6))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          focusedBorder: err == true
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5))
              : OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff2595A6), width: 1.5)),
          hintText: hint,
          labelText: label,
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white)),
    );
  }
}
