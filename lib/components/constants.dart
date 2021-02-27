import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: "email",
  hintStyle: TextStyle(color: Colors.grey),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFDFC13B), width: 2.0)),
);
