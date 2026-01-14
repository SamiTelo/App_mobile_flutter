import 'package:flutter/material.dart';
import 'package:mini_ecommerce/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  /// AJOUTER AU PANIER (avec quantité)
  void addToCart(Product product, {int quantity = 1}) {
    final index = _cart.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      _cart[index] = _cart[index].copyWith(
        quantity: _cart[index].quantity + quantity,
      );
    } else {
      _cart.add(product.copyWith(quantity: quantity));
    }
    notifyListeners();
  }

  /// SUPPRIMER
  void removeItem(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  /// + / - quantité
  void incrementQtn(int index) {
    _cart[index] = _cart[index].copyWith(
      quantity: _cart[index].quantity + 1,
    );
    notifyListeners();
  }

  void decrementQtn(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index] = _cart[index].copyWith(
        quantity: _cart[index].quantity - 1,
      );
      notifyListeners();
    }
  }

  /// TOTAL ARTICLES (pour badge)
  int get totalItems =>
      _cart.fold(0, (sum, item) => sum + item.quantity);

  /// TOTAL PRIX
  double get totalPrice =>
      _cart.fold(0, (sum, item) => sum + item.price * item.quantity);
}
