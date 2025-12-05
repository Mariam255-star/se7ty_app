import 'package:flutter/material.dart';

/// Push to a new screen
Future pushTo(BuildContext context, Widget page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

/// Replace current screen with new one
Future pushWithReplacement(BuildContext context, Widget page) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

/// Remove all previous screens and go to new one
Future pushAndRemove(BuildContext context, Widget page) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}

/// pop last screen
void pop(BuildContext context) {
  Navigator.pop(context);
}
