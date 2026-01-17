import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_ecommerce/provider/cart_provider.dart';
import 'package:mini_ecommerce/models/product_model.dart';

void main() {
  group('CartProvider Tests', () {
    late CartProvider cartProvider;
    late Product product;

    setUp(() {
      cartProvider = CartProvider();

      product = Product(
        id: 'test_1',
        title: 'Test Product',
        description: 'Fake product for testing',
        image: 'test.png',
        price: 100.0,
        rate: 4.5,
        review: 10,
        quantity: 1, // stock initial (PAS la quantité panier)
        seller: 'Test Seller',
        category: 'Shoes',
        colors: const [Colors.black],
      );
    });

    test('Ajouter un produit au panier', () {
      cartProvider.addToCart(product);

      expect(cartProvider.cart.length, 1);
      expect(cartProvider.cart.first.quantity, 1);
    });

    test('Ajouter le même produit augmente la quantité', () {
      cartProvider.addToCart(product);
      cartProvider.addToCart(product);

      expect(cartProvider.cart.length, 1);
      expect(cartProvider.cart.first.quantity, 2);
    });

    test('Ajouter avec quantité personnalisée', () {
      cartProvider.addToCart(product, quantity: 3);

      expect(cartProvider.cart.first.quantity, 3);
    });

    test('Incrémenter la quantité', () {
      cartProvider.addToCart(product);
      cartProvider.incrementQtn(0);

      expect(cartProvider.cart.first.quantity, 2);
    });

    test('Décrémenter la quantité (min = 1)', () {
      cartProvider.addToCart(product);
      cartProvider.decrementQtn(0);

      expect(cartProvider.cart.first.quantity, 1);
    });

    test('Supprimer un produit', () {
      cartProvider.addToCart(product);
      cartProvider.removeItem(0);

      expect(cartProvider.cart.isEmpty, true);
    });

    test('Total articles', () {
      cartProvider.addToCart(product);
      cartProvider.addToCart(product);

      expect(cartProvider.totalItems, 2);
    });

    test('Total prix', () {
      cartProvider.addToCart(product, quantity: 2);

      expect(cartProvider.totalPrice, 200.0);
    });
  });
}
