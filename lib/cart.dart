import 'package:cbd_grocery/items.dart';

class CartItem {
  Item item;
  int count;

  CartItem({this.item, this.count});

  void increment() {
    count += 1;
  }

  void decrement() {
    if (count == 0) {
      return;
    }
    count -= 1;
  }

  get subtotal => count * item.price;
}

class Cart {
  List<CartItem> cartItems = [];
  int count = 0;

  void addItem(CartItem cartItem) {
    cartItems.add(cartItem);
  }

  void deleteItem(CartItem cartItem) {
    cartItems.remove(cartItem);
  }

  double getTotal() {
    double total = 0;

    for (CartItem cartItem in cartItems) {
      total += cartItem.subtotal;
    }

    return total;
  }

  int getTotalItems() {
    int totalItems = 0;

    for (CartItem cartItem in cartItems) {
      totalItems += cartItem.count;
    }

    return totalItems;
  }

  void clear() {
    cartItems.clear();
    count = 0;
  }

  get length => cartItems.length;
  get total => getTotal();
  get totalItems => getTotalItems();
}
