import 'package:flutter/material.dart';

mostrarSnackbarCustom ({ required BuildContext context, required String msg, bool erro = true}){
    SnackBar snackbar = SnackBar(
      content: Text(msg),  //sendo content pode ser qualquer widget
      backgroundColor: erro ? Colors.red : Colors.green,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      
      action: SnackBarAction(label: "fechar", 
        textColor: Colors.white,
        
        onPressed: (){
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }),
        
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
}