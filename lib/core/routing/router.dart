
import 'package:ayol_uchun_exam/core/routing/routes.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/page/home_view.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [GoRoute(path: Routes.home, builder: (context, state) => HomeView())],
);
