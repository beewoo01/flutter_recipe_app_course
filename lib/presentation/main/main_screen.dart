import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;

  const MainScreen({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        onDestinationSelected: onChangeIndex,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset("assets/svg/home.svg"),
            /*Icon(
              Icons.home_outlined,
              color: ColorStyles.gray4,
            ),*/
            selectedIcon: SvgPicture.asset("assets/svg/home_selected.svg")
            /*const Stack(
              children: [
                Icon(
                  Icons.home,
                  color: ColorStyles.primary40,
                ),
                Icon(
                  Icons.home_outlined,
                  color: ColorStyles.primary100,
                ),
              ],
            )*/,
            label: "Home",
          ),
          NavigationDestination(
            icon: SvgPicture.asset("assets/svg/bookmark.svg"),
            /*Icon(
              Icons.bookmark_border,
              color: ColorStyles.gray4,
            ),*/
            selectedIcon: SvgPicture.asset("assets/svg/bookmark_selected.svg"),
            /*Stack(
              children: [
                Icon(
                  Icons.bookmark,
                  color: ColorStyles.primary40,
                ),
                Icon(
                  Icons.bookmark_border,
                  color: ColorStyles.primary100,
                ),
              ],
            ),*/
            label: "bookmark",
          ),
          NavigationDestination(
            icon: SvgPicture.asset("assets/svg/notification.svg"),
            /*Icon(
              Icons.notifications_outlined,
              color: ColorStyles.gray4,
            ),*/
            selectedIcon: SvgPicture.asset("assets/svg/notification_selected.svg"),
            /*Stack(
              children: [
                Icon(
                  Icons.notifications,
                  color: ColorStyles.primary40,
                ),
                Icon(
                  Icons.notifications_outlined,
                  color: ColorStyles.primary100,
                ),
              ],
            ),*/
            label: "notification",
          ),
          NavigationDestination(
            icon: SvgPicture.asset("assets/svg/profile.svg"),
            /*Icon(
              Icons.person_outline,
              color: ColorStyles.gray4,
            ),*/
            selectedIcon: SvgPicture.asset("assets/svg/profile_selected.svg"),
            /*Stack(
              children: [
                Icon(
                  Icons.person,
                  color: ColorStyles.primary40,
                ),
                Icon(
                  Icons.person_outline,
                  color: ColorStyles.primary100,
                ),
              ],
            ),*/
            label: "profile",
          ),
        ],
      ),
    );
  }
}
