import 'package:celltcg/ui/presentations/home/home_screen.dart';
import 'package:celltcg/ui/presentations/main/controller/main_controller.dart';
import 'package:celltcg/ui/presentations/search/search_screen.dart';
import 'package:celltcg/ui/presentations/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeScreen(),
                SearchScreen(),
                SettingsScreen()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded),
                label: 'Settings',
              )
            ],
          ),
        );
      },
    );
  }
}
