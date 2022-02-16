import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../store/constants.dart';
import 'router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        router.push(PageSignUp());
        print('Guard: User is currently signed out!');
      } else {
        // SignLogic.to.getCurrentUserId();
        resolver.next(true);
        print('Guard: User is signed in!');
      }
    });
  }
}
