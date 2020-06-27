import 'package:cbd_grocery/cart.dart';

class Order {
  List<CartItem> _cartItems = [];
  double _total;
  String _name;
  String _contact;
  String _address;
  String _deliveryTime;
  String _paymentMethod;
  String _trackingNumber;

  void initialize(
    List<CartItem> cartItems,
    double total,
    String name,
    String contact,
    String address,
    String deliveryTime,
    String paymentMethod,
    String trackingNumber,
  ) {
    _cartItems = cartItems;
    _total = total;
    _name = name;
    _contact = contact;
    _address = address;
    _deliveryTime = deliveryTime;
    _paymentMethod = paymentMethod;
    _trackingNumber = trackingNumber;
  }

  get cartItems => _cartItems;
  get total => _total;
  get name => _name;
  get contact => _contact;
  get address => _address;
  get deliveryTime => _deliveryTime;
  get paymentMethod => _paymentMethod;
  get trackingNumber => _trackingNumber;
}
