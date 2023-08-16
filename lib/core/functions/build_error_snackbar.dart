import 'package:flutter/material.dart';

import '../../Features/home/presentation/managers/featured_books_cubit/featured_books_cubit.dart';

SnackBar buildEroorMessage(String errorMessage) {
  return SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      errorMessage,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
  );
}
