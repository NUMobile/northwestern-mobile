import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // LCUser? currentUser = await LCUser.getCurrent();
    // if (currentUser == null) {
    //   router.push(PageLogin());
    // } else {
    //   bool isAuthenticated = await currentUser.isAuthenticated();
    //   if (isAuthenticated) {
    //     // session token 有效
    //     resolver.next(true);
    //   } else {
    //     // session token 无效
    //     router.push(PageLogin());
    //   }
    // }
  }
}
