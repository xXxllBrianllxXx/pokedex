import 'package:flutter/material.dart';
import 'package:pokemon_flutter/ui/screens/favorite_screen.dart';
import 'package:pokemon_flutter/ui/screens/search_screen.dart';
import 'package:pokemon_flutter/utils/constants.dart' as constants;
import 'package:provider/provider.dart';

import '../../controllers/theme_controller.dart';
import '../screens/settings_screen.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Provider.of<ThemeController>(context).themeData;
    bool isDark = themeData == ThemeData.dark();

    return SliverAppBar(
      expandedHeight: constants.homeScreenSliverAppBarHeight,
      backgroundColor: isDark ? constants.scaffoldDarkThemeColor : constants.scaffoldLightThemeColor,
      foregroundColor: isDark ? constants.scaffoldDarkThemeColor : constants.scaffoldLightThemeColor,
      shadowColor: isDark ? constants.scaffoldDarkThemeColor : constants.scaffoldLightThemeColor,
      surfaceTintColor: isDark ? constants.scaffoldDarkThemeColor : constants.scaffoldLightThemeColor,
      elevation: 0,
      pinned: false,
      floating: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).viewPadding.top + constants.screenTopPadding
			),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
				  padding: const EdgeInsets.symmetric(horizontal: 10.0),
				  child: Text(constants.homeScreenTitle,
					  	style: Theme.of(context).textTheme.displayMedium?.copyWith(
							color: isDark ? constants.homeScreenTitleDarkThemeColor : constants.homeScreenTitleLightThemeColor,
							fontWeight: FontWeight.bold,
							fontFamily: 'Pokemon'
						)
					),
				),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SettingsScreen.routeName);
                    },
                    icon: Icon(Icons.settings, color: isDark ? constants.searchIconDarkThemeColor : constants.searchIconLightThemeColor)
				),
              ],
            ),
            const SizedBox(height: constants.mediumPadding),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: constants.smallPadding),
                        height: constants.searchContainerHeight,
                        decoration: BoxDecoration(
                            color: constants.searchContainerLightThemeColor,
                            borderRadius: BorderRadius.circular(constants.containerCornerRadius)
						),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: constants.leftSearchIconColor),
                            SizedBox(width: constants.mediumPadding),
                            Text(
								constants.searchHintText,
								style: TextStyle(
									color: constants.searchHintTextColor
								)
							),
                          ],
                        )),
                    onTap: () {
                      navigateToScreen(context, SearchScreen.routeName);
                    },
                  ),
                ),
                // add space between search container and menu icon
                const SizedBox(width: constants.mediumPadding),
                Container(
                  height: constants.favoriteIconHeightAndWidth,
                  width: constants.favoriteIconHeightAndWidth,
                  decoration: BoxDecoration(
                    color: isDark
                        ? constants.favoriteIconContainerDarkThemeColor
                        : constants.favoriteIconContainerLightThemeColor,
                    borderRadius:
                    BorderRadius.circular(constants.containerCornerRadius),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.favorite_rounded),
                    color: isDark
                        ? constants.favoriteIconDarkThemeColor
                        : constants.favoriteIconLightColor,
                    onPressed: () {
                      navigateToScreen(context, FavoriteScreen.routeName);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void navigateToScreen(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

}
