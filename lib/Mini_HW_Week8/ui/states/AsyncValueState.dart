import 'package:flutter/material.dart';

class Asyncvalue<T>  {
  final T? data;
  final Object? error;
  final AsyncValueState state;
  const Asyncvalue({required this.data, required this.error, required this.state});
}

enum AsyncValueState{
  loading,
  error,
  success,
}