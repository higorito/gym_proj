import 'package:flutter/material.dart';
import 'package:gym_proj/_core/cores.dart';



InputDecoration getAutInputDecor(String label){

  return InputDecoration(
      //label: Text(label, style: const TextStyle(color: Colors.grey),),
      hintText: label,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Cores.roxoAzulado, width: 2)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Cores.roxoEscuro, width: 3.5)
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red, width: 2)
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red, width: 3.5)
      ),
  );
}