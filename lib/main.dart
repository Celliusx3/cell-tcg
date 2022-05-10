import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:celltcg/data/sources/pokemontcg/repositories/pokemontcg_repository.dart';
import 'package:celltcg/ui/routes/app_pages.dart';
import 'package:celltcg/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  await Get.putAsync<SourceRepository>(() async => PokemonTCGRepository());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: appTheme.themeData,
    );
  }
}