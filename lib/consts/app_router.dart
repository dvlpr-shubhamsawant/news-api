import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/model/news_data_model.dart';
import 'package:newsapp/views/home_screen/home_screen.dart';
import 'package:newsapp/views/news_detail_screen/news_detail_screen.dart';
import 'package:newsapp/views/splash_screen/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: SplashScreen.id,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: "/homescreen",
        name: HomeScreen.id,
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
              path: 'newsdetailscreen',
              name: NewsDetailScreen.id,
              builder: (context, state) {
                final dataModel = state.extra as Articles;
                return NewsDetailScreen(model: dataModel);
              })
        ],
      )
    ],
  );
}
