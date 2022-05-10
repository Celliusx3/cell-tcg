
import 'package:celltcg/ui/presentations/card_details/binding/card_details_binding.dart';
import 'package:celltcg/ui/presentations/card_details/card_details_screen.dart';
import 'package:celltcg/ui/presentations/cards/binding/cards_binding.dart';
import 'package:celltcg/ui/presentations/cards/cards_screen.dart';
import 'package:celltcg/ui/presentations/home/binding/home_binding.dart';
import 'package:celltcg/ui/presentations/main/binding/main_binding.dart';
import 'package:celltcg/ui/presentations/main/main_screen.dart';
import 'package:celltcg/ui/presentations/search/binding/search_binding.dart';
import 'package:celltcg/ui/presentations/settings/binding/settings_binding.dart';
import 'package:celltcg/ui/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
        name: Routes.MAIN,
        page: () => const MainScreen(),
        bindings: [
          MainBinding(),
          HomeBinding(),
          SearchBinding(),
          SettingsBinding()
        ]
    ),
    GetPage(
      name: Routes.CARDS,
      page: () => const CardsScreen(),
      binding: CardsBinding(),
    ),
    GetPage(
      name: Routes.CARD_DETAILS,
      page: () => const CardDetailsScreen(),
      binding: CardDetailsBinding(),
    )
  ];
}