import 'package:flutter/material.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  /// Ajouter / retirer des favoris
  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  /// Supprimer directement
  void removeFavorite(Product product) {
    _favorites.remove(product);
    notifyListeners();
  }

  /// Vérifier si un produit est favori
  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }

  /// Vider les favoris (optionnel)
  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }

  /// Helper comme ton CartProvider
  static FavoriteProvider of(BuildContext context) {
    return context.watch<FavoriteProvider>();
  }
}
