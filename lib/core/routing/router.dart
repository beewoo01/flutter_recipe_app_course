import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/main.dart';
import 'package:flutter_recipe_app_course/presentation/home/screen/home_root.dart';
import 'package:flutter_recipe_app_course/presentation/ingredient/screen/ingredient_root.dart';

import 'package:flutter_recipe_app_course/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app_course/presentation/notifications/notifications_screen.dart';
import 'package:flutter_recipe_app_course/presentation/profile/profile_screen.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:flutter_recipe_app_course/presentation/search/screen/search_root.dart';
import 'package:flutter_recipe_app_course/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe_app_course/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app_course/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app_course/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RoutePaths.splash,
  // initialLocation: RoutePaths.test,
  routes: [
    GoRoute(
        path: RoutePaths.ingredient,
        builder: (context, state) {
          final recipeId = int.parse(state.pathParameters['recipeId']!);
          return IngredientRoot(
            recipeId: recipeId,
          );
        }),
    GoRoute(
        path: RoutePaths.test,
        builder: (context, state) => const ComponentScreen()),
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => SplashScreen(
        onTapStartCooking: () => context.go(RoutePaths.signIn),
      ),
    ),
    GoRoute(
      path: RoutePaths.signIn,
      builder: (context, state) => SignInScreen(
        onTapSignUp: () => context.go(RoutePaths.signUp),
        onTapSignIn: () => context.go(RoutePaths.home),
      ),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) => SignUpScreen(
        onTapSignIn: () => context.go(RoutePaths.signIn),
      ),
    ),
    GoRoute(
      path: RoutePaths.search,
      builder: (context, state) => const SearchRoot(),
    ),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(
            body: navigationShell,
            currentPageIndex: navigationShell.currentIndex,
            onChangeIndex: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                builder: (context, state) => const HomeRoot(),
                routes: [
                  ///MEMO : BottomNavigator영역을 남기려면 하단에 GoRoute를 배치하면 됩니다.
                  ///현재 프로젝트에서는 남기지 않을것입니다.
                  /*GoRoute(
                    path: "Search",
                    builder: (context, state) => const SearchScreen(),
                  ),*/
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.savedRecipes,
                builder: (context, state) => const SavedRecipesRoot(),
              ),
            ],
          ),
          StatefulShellBranch(routes: [
            GoRoute(
              path: RoutePaths.notifications,
              builder: (context, state) => const NotificationsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: RoutePaths.profile,
              builder: (context, state) => const ProfileScreen(),
            ),
          ])
        ]),
  ],
);
