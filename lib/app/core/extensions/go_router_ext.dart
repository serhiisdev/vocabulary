import 'package:go_router/go_router.dart';

extension GoRouterExt on GoRouter {
  void maybePop() {
    if (!canPop()) return;
    pop();
  }
}