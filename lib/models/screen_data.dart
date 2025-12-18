import 'package:flutter/material.dart';

// Import des screens dédiés
import '../screens/home/home_screen.dart';
import '../screens/detail/detail_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/favoris/favoris_screen.dart';
import '../screens/profile/profile_screen.dart';

// Import des AppBars dédiés
import '../widgets/appbar/home_app_bar.dart';
import '../widgets/appbar/detail_app_bar.dart';
import '../widgets/appbar/cart_app_bar.dart';
import '../widgets/appbar/favoris_app_bar.dart';
import '../widgets/appbar/profile_app_bar.dart';

class ScreenData {
  final Widget screen;
  final PreferredSizeWidget appBar;
  const ScreenData({required this.screen, required this.appBar});
}

final List<ScreenData> screensData = const [
  ScreenData(screen: DetailScreen(), appBar: DetailAppBar()), // index 0 → Grid
  ScreenData(screen: FavoriteScreen(), appBar: FavorisAppBar()), // index 1 → Favorite
  ScreenData(screen: HomeScreen(), appBar: HomeAppBar()), // index 2 → Home via FAB
  ScreenData(screen: CartScreen(), appBar: CartAppBar()), // index 3 → Cart
  ScreenData(screen: ProfileScreen(), appBar: ProfileAppBar()),  // index 4 → Profile
];
