import 'package:cbd_grocery/cart.dart';
import 'package:cbd_grocery/constants.dart';
import 'package:cbd_grocery/form_screen.dart';
import 'package:cbd_grocery/item_card.dart';
import 'package:cbd_grocery/items.dart';
import 'package:cbd_grocery/my_order.dart';
import 'package:cbd_grocery/order.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double width;
  double height;
  Items items = new Items();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Cart cart = new Cart();
  List<Order> orders = [];

  Order order = new Order();

  @override
  void initState() {
    order.initialize([
      CartItem(
        item: Item(
          name: 'Cherry',
          price: 2.65,
          desc: '100g',
          imagePath: 'images/cherry.jpg',
        ),
        count: 2,
      ),
      CartItem(
        item: Item(
          name: 'Lemon',
          price: 4.2,
          desc: '6 pieces',
          imagePath: 'images/lemon.jpg',
        ),
        count: 1,
      ),
      CartItem(
        item: Item(
          name: 'Asparagus',
          price: 1.8,
          desc: '150g',
          imagePath: 'images/asparagus.jpg',
        ),
        count: 1,
      )
    ], 24.5, 'Waynn Toh', '0192839102', '1, Lorong TD7, 34000 Taiping, Perak',
        '10AM - 1PM', 'Paypal', '#56652533583280604343788647881423');
    orders.add(order);
    super.initState();
  }

  Order searchTrackingNumber(String query) {
    Order order;

    for (Order o in orders) {
      if (o.trackingNumber == query) {
        order = o;
      }
    }

    return order;
  }

  void addToCart(Item item, int count) {
    setState(() {
      CartItem newCartItem = new CartItem(item: item, count: count);
      cart.addItem(newCartItem);
    });
  }

  void addOrder(Order order) {
    setState(() {
      orders.add(order);
    });

    cart.clear();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(
        height: height,
        width: 375,
        child: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My ',
                      style: kHeaderTextStyle.copyWith(
                        fontSize: 24,
                        color: Color(0xFFFFB026),
                      ),
                    ),
                    Text(
                      'Cart',
                      style: kHeaderTextStyle.copyWith(fontSize: 24),
                    ),
                    SizedBox(width: 16),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xFFFFB026),
                      child: Text(
                        '${cart.totalItems}',
                        style: kHeaderTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: cart.length == 0
                        ? Center(
                            child: Text(
                              'Your cart is empty',
                              style: kDefaultTextStyle.copyWith(fontSize: 21),
                            ),
                          )
                        : ListView.builder(
                            itemCount: cart.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 343,
                                height: 80,
                                margin: EdgeInsets.only(bottom: 16),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFF3F3F3),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 96,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          cart.cartItems[index].item.imagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          Text(
                                            '${cart.cartItems[index].item.name}',
                                            style: kDefaultTextStyle.copyWith(
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: <Widget>[
                                                InkWell(
                                                  mouseCursor:
                                                      MaterialStateMouseCursor
                                                          .clickable,
                                                  child: Container(
                                                    height: 28,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(4),
                                                        bottomLeft:
                                                            Radius.circular(4),
                                                      ),
                                                      border: Border.all(
                                                        color: kOrange4,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.remove,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      cart.cartItems[index]
                                                          .decrement();
                                                    });
                                                  },
                                                ),
                                                Container(
                                                  height: 28,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    border: Border.symmetric(
                                                      vertical: BorderSide(
                                                        color: kOrange4,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${cart.cartItems[index].count}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: kDefaultTextStyle,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  mouseCursor:
                                                      MaterialStateMouseCursor
                                                          .clickable,
                                                  child: Container(
                                                    height: 28,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(4),
                                                        bottomRight:
                                                            Radius.circular(4),
                                                      ),
                                                      border: Border.all(
                                                        color: kOrange4,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      cart.cartItems[index]
                                                          .increment();
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 70),
                                            Text(
                                              'RM${(cart.cartItems[index].subtotal.toStringAsFixed(2))}',
                                              style: kDefaultTextStyle.copyWith(
                                                fontWeight: FontWeight.w900,
                                                color: kOrange5,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  height: 52,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  color:
                      cart.length != 0 ? Color(0xFFEBEBEB) : Colors.transparent,
                  child: cart.length != 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Item Total',
                              style: kDefaultTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'RM${cart.total.toStringAsFixed(2)}',
                              style: kDefaultTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: kOrange5,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
                SizedBox(height: 12),
                Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: cart.length != 0 ? Color(0xFFFFA014) : kGrey0,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Checkout',
                          style: kHeaderTextStyle.copyWith(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                    onTap: () {
                      if (cart.length == 0) {
                        return;
                      }
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: Duration(milliseconds: 750),
                          child: FormScreen(
                            addOrder: addOrder,
                            cart: cart,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFFFF9EF),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            child: Row(
              children: [
                Text(
                  'MY',
                  style: kHeaderTextStyle.copyWith(fontSize: 32),
                ),
                Text(
                  ' GROCERY',
                  style: kHeaderTextStyle.copyWith(
                    color: Color(0xFFFFB026),
                    fontSize: 32,
                  ),
                ),
                Spacer(),
                InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  child: Text(
                    'MY ORDER',
                    style: kHeaderTextStyle.copyWith(
                        color: Colors.grey[400], fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: Duration(milliseconds: 750),
                        child: MyOrderScreen(searchOrder: searchTrackingNumber),
                      ),
                    );
                  },
                ),
                SizedBox(width: 72),
                InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  child: SizedBox(
                      width: 55,
                      height: 55,
                      child: Image.asset('images/shopping-cart.png')),
                  onTap: () => _scaffoldKey.currentState.openEndDrawer(),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 42),
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                primary: false,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                crossAxisCount: 5,
                children: <Widget>[
                  ItemCard(item: items.fruits[0], addThis: addToCart),
                  ItemCard(item: items.fruits[1], addThis: addToCart),
                  ItemCard(item: items.fruits[2], addThis: addToCart),
                  ItemCard(item: items.fruits[3], addThis: addToCart),
                  ItemCard(item: items.fruits[4], addThis: addToCart),
                  ItemCard(item: items.fruits[5], addThis: addToCart),
                  ItemCard(item: items.fruits[6], addThis: addToCart),
                  ItemCard(item: items.fruits[7], addThis: addToCart),
                  ItemCard(item: items.fruits[8], addThis: addToCart),
                  ItemCard(item: items.fruits[9], addThis: addToCart),
                  ItemCard(item: items.veges[0], addThis: addToCart),
                  ItemCard(item: items.veges[1], addThis: addToCart),
                  ItemCard(item: items.veges[2], addThis: addToCart),
                  ItemCard(item: items.veges[3], addThis: addToCart),
                  ItemCard(item: items.veges[4], addThis: addToCart),
                  ItemCard(item: items.veges[5], addThis: addToCart),
                  ItemCard(item: items.veges[6], addThis: addToCart),
                  ItemCard(item: items.veges[7], addThis: addToCart),
                  ItemCard(item: items.veges[8], addThis: addToCart),
                  ItemCard(item: items.veges[9], addThis: addToCart),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
