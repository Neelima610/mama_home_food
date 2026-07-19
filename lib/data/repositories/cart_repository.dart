

// cart_repository.dart
import '../../models/cart/cart_model.dart';
import '../../models/product/product_model.dart';
import '../dummy/cart_data.dart';

class CartRepository {
  CartRepository._();

  /// Local cart list
  static final List<CartModel> _cartItems =
      List.from(CartData.cartItems);

  /// Get all cart items
  static List<CartModel> getCartItems() {
    return List.unmodifiable(_cartItems);
  }

  //--------------------------------------------------
// Check Product Exists
//--------------------------------------------------

static bool containsProduct(
  String productId,
) {
  return _cartItems.any(
    (item) => item.product.id == productId,
  );
}

  /// Add product to cart
  static void addToCart(
    ProductModel product, {
    int quantity = 1,
  }) {
     if (quantity <= 0) return;
    final index = _cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (index != -1) {
      final current = _cartItems[index];

      _cartItems[index] = current.copyWith(
        quantity: current.quantity + quantity,
      );
    } else {
      _cartItems.add(
        CartModel(
          product: product,
          quantity: quantity,
        ),
      );
    }
  }

  /// Remove product
  static void removeFromCart(
    String productId,
  ) {
    _cartItems.removeWhere(
      (item) => item.product.id == productId,
    );
  }

  /// Increase quantity
  static void increaseQuantity(
    String productId,
  ) {
    final index = _cartItems.indexWhere(
      (item) => item.product.id == productId,
    );

    if (index != -1) {
      final current = _cartItems[index];

      _cartItems[index] = current.copyWith(
        quantity: current.quantity + 1,
      );
    }
  }

  /// Decrease quantity
  static void decreaseQuantity(
    String productId,
  ) {
    final index = _cartItems.indexWhere(
      (item) => item.product.id == productId,
    );

    if (index != -1) {
      final current = _cartItems[index];

      if (current.quantity > 1) {
        _cartItems[index] = current.copyWith(
          quantity: current.quantity - 1,
        );
      } else {
        _cartItems.removeAt(index);
      }
    }
  }

  /// Clear cart
  static void clearCart() {
    _cartItems.clear();
  }

  /// Total cart price
  static double getTotalPrice() {
    return _cartItems.fold(
      0,
      (total, item) => total + item.totalPrice,
    );
  }

  //--------------------------------------------------
// Subtotal
//--------------------------------------------------

static double getSubtotal() {
  return _cartItems.fold(
    0,
    (sum, item) => sum + item.totalPrice,
  );
}

  /// Total items
  static int getTotalItems() {
    return _cartItems.fold(
      0,
      (total, item) => total + item.quantity,
    );
  }
  //--------------------------------------------------
// Unique Products
//--------------------------------------------------

static int getUniqueItemsCount() {
  return _cartItems.length;
}
}