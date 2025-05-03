import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExt on BuildContext {
  GoRouter get router => GoRouter.of(this);
  ThemeData get theme => Theme.of(this);
}
