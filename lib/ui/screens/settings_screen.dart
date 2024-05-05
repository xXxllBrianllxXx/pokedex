import 'package:flutter/material.dart';
import 'package:pokemon_flutter/utils/constants.dart' as constants;
import 'package:provider/provider.dart';

import '../../controllers/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = 'SettingsScreen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Provider.of<ThemeController>(context).themeData;
    bool isDark = themeData == ThemeData.dark();
    return Scaffold(
		backgroundColor: isDark ? constants.appBarDarkThemeColor : constants.scaffoldLightThemeColor,
        appBar: AppBar(
			backgroundColor: isDark ? constants.appBarDarkThemeColor : constants.scaffoldLightThemeColor,
			title: Text('Configuración', style: TextStyle(color: !isDark ? constants.appBarDarkThemeColor : constants.scaffoldLightThemeColor)),
			iconTheme: IconThemeData(
				color: !isDark ? constants.appBarDarkThemeColor : constants.scaffoldLightThemeColor
			),
        ),
        body: Padding(
          padding: const EdgeInsets.all(constants.mediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tema oscuro'),
                  	Switch(
						activeColor: constants.scaffoldLightThemeColor,
						inactiveTrackColor: constants.scaffoldLightThemeColor,
						value: isDark,
						onChanged: (value) {
							Provider.of<ThemeController>(context, listen: false).toggleTheme();
						}
					),
                ],
              ),
              const SizedBox(height: constants.smallPadding),
              const Divider(height: 5),
              const SizedBox(height: constants.smallPadding),
              const Text('Version de la App: 1.0.0'),
              const SizedBox(height: constants.mediumPadding),
              const Divider(height: 5),
              const SizedBox(height: constants.smallPadding),
              const Text('Creditos:'),
              const SizedBox(height: constants.smallPadding),
              const Text('Api: pokeapi.com'),
              const Text('Imágenes: pokemon.com'),
            ],
          ),
        ));
  }
}
